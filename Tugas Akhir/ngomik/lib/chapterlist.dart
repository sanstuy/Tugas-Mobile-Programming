// To parse this JSON data, do
//
//     final chapterList = chapterListFromJson(jsonString);

import 'dart:convert';

ChapterList chapterListFromJson(String str) => ChapterList.fromJson(json.decode(str));

String chapterListToJson(ChapterList data) => json.encode(data.toJson());

class ChapterList {
    ChapterList({
        this.results,
        this.limit,
        this.offset,
        this.total,
    });

    List<ResultElement> results;
    int limit;
    int offset;
    int total;

    factory ChapterList.fromJson(Map<String, dynamic> json) => ChapterList(
        results: List<ResultElement>.from(json["results"].map((x) => ResultElement.fromJson(x))),
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "limit": limit,
        "offset": offset,
        "total": total,
    };
}

class ResultElement {
    ResultElement({
        this.result,
        this.data,
        this.relationships,
    });

    ResultEnum result;
    Data data;
    List<Relationship> relationships;

    factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
        result: resultEnumValues.map[json["result"]],
        data: Data.fromJson(json["data"]),
        relationships: List<Relationship>.from(json["relationships"].map((x) => Relationship.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": resultEnumValues.reverse[result],
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
    DataType type;
    Attributes attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: dataTypeValues.map[json["type"]],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": dataTypeValues.reverse[type],
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.volume,
        this.chapter,
        this.title,
        this.translatedLanguage,
        this.hash,
        this.data,
        this.dataSaver,
        this.publishAt,
        this.createdAt,
        this.updatedAt,
        this.version,
    });

    String volume;
    String chapter;
    Title title;
    TranslatedLanguage translatedLanguage;
    String hash;
    List<String> data;
    List<String> dataSaver;
    DateTime publishAt;
    DateTime createdAt;
    DateTime updatedAt;
    int version;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        volume: json["volume"],
        chapter: json["chapter"],
        title: titleValues.map[json["title"]],
        translatedLanguage: translatedLanguageValues.map[json["translatedLanguage"]],
        hash: json["hash"],
        data: List<String>.from(json["data"].map((x) => x)),
        dataSaver: List<String>.from(json["dataSaver"].map((x) => x)),
        publishAt: DateTime.parse(json["publishAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "volume": volume,
        "chapter": chapter,
        "title": titleValues.reverse[title],
        "translatedLanguage": translatedLanguageValues.reverse[translatedLanguage],
        "hash": hash,
        "data": List<dynamic>.from(data.map((x) => x)),
        "dataSaver": List<dynamic>.from(dataSaver.map((x) => x)),
        "publishAt": publishAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "version": version,
    };
}

enum Title { EMPTY, SEASON_1_FINALE }

final titleValues = EnumValues({
    "": Title.EMPTY,
    "Season 1 Finale": Title.SEASON_1_FINALE
});

enum TranslatedLanguage { EN }

final translatedLanguageValues = EnumValues({
    "en": TranslatedLanguage.EN
});

enum DataType { CHAPTER }

final dataTypeValues = EnumValues({
    "chapter": DataType.CHAPTER
});

class Relationship {
    Relationship({
        this.id,
        this.type,
    });

    String id;
    RelationshipType type;

    factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json["id"],
        type: relationshipTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": relationshipTypeValues.reverse[type],
    };
}

enum RelationshipType { SCANLATION_GROUP, MANGA, USER }

final relationshipTypeValues = EnumValues({
    "manga": RelationshipType.MANGA,
    "scanlation_group": RelationshipType.SCANLATION_GROUP,
    "user": RelationshipType.USER
});

enum ResultEnum { OK }

final resultEnumValues = EnumValues({
    "ok": ResultEnum.OK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
