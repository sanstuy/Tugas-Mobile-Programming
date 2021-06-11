// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        this.result,
        this.token,
    });

    String result;
    Token token;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        result: json["result"],
        token: Token.fromJson(json["token"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "token": token.toJson(),
    };
}

class Token {
    Token({
        this.session,
        this.refresh,
    });

    String session;
    String refresh;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        session: json["session"],
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "session": session,
        "refresh": refresh,
    };
}
