// To parse this JSON data, do
//
//     final cover = coverFromJson(jsonString);

import 'dart:convert';

Cover coverFromJson(String str) => Cover.fromJson(json.decode(str));

String coverToJson(Cover data) => json.encode(data.toJson());

class Cover {
    Cover({
        this.result,
        this.data,
        this.relationships,
    });

    String result;
    Data data;
    List<Relationship> relationships;

    factory Cover.fromJson(Map<String, dynamic> json) => Cover(
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
        this.volume,
        this.fileName,
        this.description,
        this.version,
        this.createdAt,
        this.updatedAt,
    });

    String volume;
    String fileName;
    String description;
    int version;
    String createdAt;
    String updatedAt;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        volume: json["volume"],
        fileName: json["fileName"],
        description: json["description"],
        version: json["version"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "volume": volume,
        "fileName": fileName,
        "description": description,
        "version": version,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
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
