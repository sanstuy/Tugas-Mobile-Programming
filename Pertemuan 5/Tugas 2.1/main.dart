import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Pertemuan 5 2.1',
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.red),
                      height: 642.5,
                      width: 100,
                      margin: EdgeInsets.only(top: 42.5, bottom: 42.5),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.yellow),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left:46.35, right: 46.35),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.green),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left:46.35, right: 46.35),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.red),
                      height: 642.5,
                      width: 100,
                      margin: EdgeInsets.only(top: 42.5, bottom: 42.5),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
