import 'package:flutter/material.dart';
import 'package:ngomik/login.dart';
import 'package:ngomik/services.dart';

class VUser extends StatelessWidget {
  final Token _token;
  VUser(this._token);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Account"),
      ),
      body: FutureBuilder(
        future: Services.getUser(_token.session),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("User ID:\n" + snapshot.data.data.id, style: TextStyle(fontSize: 20),),
                    Text("User Type:\n" +snapshot.data.data.type, style: TextStyle(fontSize: 30),),
                    Text("Username:\n" +snapshot.data.data.attributes.username, style: TextStyle(fontSize: 30),),
                  ],
                ),
              );
              break;
            default:
              return Column(
                children: <Widget>[Text("Loading...")],
              );
          }
        },
      ),
    );
  }
}
