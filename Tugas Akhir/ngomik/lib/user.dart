// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.result,
        this.data,
        this.relationships,
    });

    String result;
    Data data;
    List<Relationship> relationships;

    factory User.fromJson(Map<String, dynamic> json) => User(
        result: json["result"],
        data: Data.fromJson(json["data"]),
        relationships: List<Relationship>.from(json["relationships"].map((x) => Relationship.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "data": data.toJson(),
        "relationships": List<dynamic>.from(relationships.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.id,
        this.type,
        this.attributes,
    });

    String id;
    String type;
    Attributes attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.username,
        this.version,
    });

    String username;
    int version;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        username: json["username"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "version": version,
    };
}

class Relationship {
    Relationship({
        this.id,
        this.type,
    });

    String id;
    String type;

    factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}
