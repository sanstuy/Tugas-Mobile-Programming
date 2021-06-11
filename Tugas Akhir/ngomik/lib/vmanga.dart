import 'package:flutter/material.dart';
import 'package:ngomik/about.dart';
import 'package:ngomik/login.dart';
import 'package:ngomik/logout.dart';
import 'package:ngomik/main.dart';
import 'package:ngomik/mangalist.dart';
import 'package:ngomik/services.dart';
import 'package:ngomik/vchapter.dart';
import 'package:ngomik/vuser.dart';

class Vmanga extends StatefulWidget {
  final Token _token;
  const Vmanga(this._token);

  @override
  _Vmanga createState() => _Vmanga();
}

class _Vmanga extends State<Vmanga> {
  Logout _logout;
  MangaList _mangaList;

  @override
  void initState() {
    super.initState();
    Services.getMangaList().then((mangaList) {
      setState(() {
        _mangaList = mangaList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Services.postLogout().then((logout) {
                _logout = logout;
                print('${_logout.result}');

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              });
            },
            child: Text('Logout'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Text("Ngomik!"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
            child: IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VUser(widget._token)));
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                }),
          ),
        ],
      )),
      body: ListView(
        children: <Widget>[
          FutureBuilder(
              future: Services.getMangaList(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Column(children: [
                      for (var i = 0; i < 10; i++)
                        FutureBuilder(
                            future: Services.getCover(
                                snapshot.data.results[i].relationships[2].id),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: ElevatedButton(
                                          child: Container(
                                            width: 150,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      Services.getCoverImage(
                                                          _mangaList.results[i]
                                                              .data.id,
                                                          snapshot
                                                              .data
                                                              .data
                                                              .attributes
                                                              .fileName)),
                                                  fit: BoxFit.fitHeight),
                                            ),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                                _mangaList.results[i].data
                                                    .attributes.title.en,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    backgroundColor:
                                                        Colors.black,
                                                    fontSize: 15)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Vchapter(
                                                            _mangaList
                                                                .results[i]
                                                                .data
                                                                .id,
                                                            snapshot
                                                                .data
                                                                .data
                                                                .attributes
                                                                .fileName,
                                                            _mangaList
                                                                .results[i]
                                                                .data
                                                                .attributes
                                                                .title
                                                                .en,
                                                            _mangaList
                                                                .results[i]
                                                                .data
                                                                .attributes
                                                                .description
                                                                .en)));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0)),
                                        ),
                                      ),
                                    ],
                                  );
                                  break;
                                default:
                                  return Column(
                                    children: [
                                      for (var i = 0; i < 10; i++)
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: ElevatedButton(
                                            child: Container(
                                              width: 150,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://media2.giphy.com/media/3oEjI6SIIHBdRxXI40/200.gif'),
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ),
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(0)),
                                          ),
                                        ),
                                    ],
                                  );
                              }
                            }),
                    ]);
                    break;
                  default:
                    return Column(
                      children: [
                        for (var i = 0; i < 10; i++)
                          Container(
                            margin: EdgeInsets.all(20),
                            child: ElevatedButton(
                              child: Container(
                                // margin: EdgeInsets.all(20),
                                width: 150,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://media2.giphy.com/media/3oEjI6SIIHBdRxXI40/200.gif'),
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0)),
                            ),
                          ),
                      ],
                    );
                }
              })
        ],
      ),
    );
  }
}
