import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Pertemuan 5 2.2',
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://scontent.fcgk27-1.fna.fbcdn.net/v/t1.0-0/s552x414/109461037_4393925477286055_607815985182926661_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=174925&_nc_ohc=AQXpMXCKN4UAX_XvVBA&_nc_ht=scontent.fcgk27-1.fna&tp=7&oh=73d1fac1c8d9c243f63253cdf049e9c2&oe=6085DB98"),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Sandy Syulthon Irfana",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "Mahasiswa",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[100],
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                indent: 100,
                endIndent: 100,
              ),
              Card(
                  margin: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    const ListTile(
                      minLeadingWidth: 40,
                      leading: Icon(Icons.phone),
                      title: Text(
                        '+6282114690663',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ])),
              Card(
                  margin: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        'sandy330si@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ])),
            ],
          ),
        )),
      ),
    );
  }
}
