// To parse this JSON data, do
//
//     final logout = logoutFromJson(jsonString);

import 'dart:convert';

Logout logoutFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutToJson(Logout data) => json.encode(data.toJson());

class Logout {
    Logout({
        this.result,
    });

    String result;

    factory Logout.fromJson(Map<String, dynamic> json) => Logout(
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
    };
}
