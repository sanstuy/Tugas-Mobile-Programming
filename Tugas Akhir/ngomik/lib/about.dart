import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nama : Sandy Syulthon Irfana",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "NPM : 065118033\n",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Nama : Jeremy Felix L.",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "NPM : 065118049\n",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Nama : M. Gemilang Ramadhan",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "NPM : 065118056\n",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      )),
    );
  }
}
