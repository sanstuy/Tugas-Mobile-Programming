import 'package:flutter/material.dart';
import 'package:ngomik/services.dart';

class ReadChapter extends StatefulWidget {
  final String idchapter;
  final String hash;
  final List data;
  final String chapter;
  const ReadChapter(this.idchapter, this.hash, this.data, this.chapter);

  @override
  _ReadChapter createState() => _ReadChapter();
}

class _ReadChapter extends State<ReadChapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Chapter " + widget.chapter.toString()))),
      body: ListView(children: <Widget>[
        FutureBuilder(
            future: Services.getBaseUrl(widget.idchapter),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Column(
                    children: [
                      for(var i = 0; i < widget.data.length; i++)
                      Image.network(Services.getChapterImage(snapshot.data.baseUrl, widget.hash, widget.data[i])),
                    ],
                  );
                  break;
                default:
                  return Column(
                    children: [
                      Text("Loading"),
                    ],
                  );
              }
            })
      ]),
    );
  }
}
