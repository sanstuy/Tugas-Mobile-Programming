// To parse this JSON data, do
//
//     final atHome = atHomeFromJson(jsonString);

import 'dart:convert';

AtHome atHomeFromJson(String str) => AtHome.fromJson(json.decode(str));

String atHomeToJson(AtHome data) => json.encode(data.toJson());

class AtHome {
    AtHome({
        this.baseUrl,
    });

    String baseUrl;

    factory AtHome.fromJson(Map<String, dynamic> json) => AtHome(
        baseUrl: json["baseUrl"],
    );

    Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
    };
}
