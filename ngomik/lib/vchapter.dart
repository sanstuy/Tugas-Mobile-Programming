import 'package:flutter/material.dart';
import 'package:ngomik/vreadchapter.dart';
import 'package:ngomik/services.dart';

class Vchapter extends StatefulWidget {
  final String idmanga;
  final String filename;
  final String judul;
  final String detail;
  const Vchapter(this.idmanga, this.filename, this.judul, this.detail);

  @override
  _Vchapter createState() => _Vchapter();
}

class _Vchapter extends State<Vchapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.judul)),
      body: ListView(children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(Services.getCoverImage(
                          widget.idmanga, widget.filename)),
                      fit: BoxFit.fitHeight),
                ),
              ),
              Container(
                width: 192.7,
                height: 300,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          maxLines: 17,
                          text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              text: widget.detail),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: FutureBuilder(
              future: Services.getChapterList(widget.idmanga),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Column(children: <Widget>[
                      for (var i = 0; i < snapshot.data.results.length; i++)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReadChapter(
                                        snapshot.data.results[i].data.id,
                                        snapshot.data.results[i].data.attributes
                                            .hash,
                                        snapshot.data.results[i].data.attributes
                                            .data,
                                        snapshot.data.results[i].data.attributes
                                            .chapter)));
                          },
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "Chapter " +
                                      snapshot.data.results[i].data.attributes
                                          .chapter)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(150, 5, 150, 5),
                          ),
                        )
                      // "Chapter " +snapshot.data.results[i].data.attributes.chapter
                      // snapshot.data.results[i].data.id.to
                    ]);
                    break;
                  default:
                    return Text("Loading...");
                }
              }),
          // for (var i = 0; i < 100; i++)
          // Text("Chapter " + i.toString())
        ),
      ]),
    );
  }
}
