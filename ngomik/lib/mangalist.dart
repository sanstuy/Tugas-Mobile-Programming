// To parse this JSON data, do
//
//     final manga = mangaFromJson(jsonString);

import 'dart:convert';

MangaList mangaListFromJson(String str) => MangaList.fromJson(json.decode(str));

String mangaListToJson(MangaList data) => json.encode(data.toJson());

class MangaList {
    MangaList({
        this.results,
        this.limit,
        this.offset,
        this.total,
    });

    List<ResultElement> results;
    int limit;
    int offset;
    int total;

    factory MangaList.fromJson(Map<String, dynamic> json) => MangaList(
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
    DataAttributes attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: dataTypeValues.map[json["type"]],
        attributes: DataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": dataTypeValues.reverse[type],
        "attributes": attributes.toJson(),
    };
}

class DataAttributes {
    DataAttributes({
        this.title,
        this.altTitles,
        this.description,
        this.isLocked,
        this.links,
        this.originalLanguage,
        this.lastVolume,
        this.lastChapter,
        this.publicationDemographic,
        this.status,
        this.year,
        this.contentRating,
        this.tags,
        this.createdAt,
        this.updatedAt,
        this.version,
    });

    Title title;
    List<Title> altTitles;
    Description description;
    bool isLocked;
    Links links;
    OriginalLanguage originalLanguage;
    String lastVolume;
    String lastChapter;
    String publicationDemographic;
    Status status;
    dynamic year;
    ContentRating contentRating;
    List<Tag> tags;
    DateTime createdAt;
    DateTime updatedAt;
    int version;

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        title: Title.fromJson(json["title"]),
        altTitles: List<Title>.from(json["altTitles"].map((x) => Title.fromJson(x))),
        description: Description.fromJson(json["description"]),
        isLocked: json["isLocked"],
        links: Links.fromJson(json["links"]),
        originalLanguage: originalLanguageValues.map[json["originalLanguage"]],
        lastVolume: json["lastVolume"] == null ? null : json["lastVolume"],
        lastChapter: json["lastChapter"],
        publicationDemographic: json["publicationDemographic"] == null ? null : json["publicationDemographic"],
        status: statusValues.map[json["status"]],
        year: json["year"],
        contentRating: contentRatingValues.map[json["contentRating"]],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "altTitles": List<dynamic>.from(altTitles.map((x) => x.toJson())),
        "description": description.toJson(),
        "isLocked": isLocked,
        "links": links.toJson(),
        "originalLanguage": originalLanguageValues.reverse[originalLanguage],
        "lastVolume": lastVolume == null ? null : lastVolume,
        "lastChapter": lastChapter,
        "publicationDemographic": publicationDemographic == null ? null : publicationDemographic,
        "status": statusValues.reverse[status],
        "year": year,
        "contentRating": contentRatingValues.reverse[contentRating],
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "version": version,
    };
}

class Title {
    Title({
        this.en,
    });

    String en;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

enum ContentRating { SAFE, SUGGESTIVE }

final contentRatingValues = EnumValues({
    "safe": ContentRating.SAFE,
    "suggestive": ContentRating.SUGGESTIVE
});

class Description {
    Description({
        this.de,
        this.en,
        this.fr,
        this.it,
        this.ro,
        this.ru,
        this.tr,
        this.cs,
        this.pt,
        this.ptBr,
    });

    String de;
    String en;
    String fr;
    String it;
    String ro;
    String ru;
    String tr;
    String cs;
    String pt;
    String ptBr;

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        de: json["de"] == null ? null : json["de"],
        en: json["en"],
        fr: json["fr"] == null ? null : json["fr"],
        it: json["it"] == null ? null : json["it"],
        ro: json["ro"] == null ? null : json["ro"],
        ru: json["ru"] == null ? null : json["ru"],
        tr: json["tr"] == null ? null : json["tr"],
        cs: json["cs"] == null ? null : json["cs"],
        pt: json["pt"] == null ? null : json["pt"],
        ptBr: json["pt-br"] == null ? null : json["pt-br"],
    );

    Map<String, dynamic> toJson() => {
        "de": de == null ? null : de,
        "en": en,
        "fr": fr == null ? null : fr,
        "it": it == null ? null : it,
        "ro": ro == null ? null : ro,
        "ru": ru == null ? null : ru,
        "tr": tr == null ? null : tr,
        "cs": cs == null ? null : cs,
        "pt": pt == null ? null : pt,
        "pt-br": ptBr == null ? null : ptBr,
    };
}

class Links {
    Links({
        this.al,
        this.ap,
        this.kt,
        this.mu,
        this.nu,
        this.mal,
        this.raw,
        this.engtl,
        this.bw,
        this.amz,
        this.cdj,
        this.ebj,
        this.dj,
    });

    String al;
    String ap;
    String kt;
    String mu;
    String nu;
    String mal;
    String raw;
    String engtl;
    String bw;
    String amz;
    String cdj;
    String ebj;
    String dj;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        al: json["al"],
        ap: json["ap"],
        kt: json["kt"],
        mu: json["mu"],
        nu: json["nu"] == null ? null : json["nu"],
        mal: json["mal"],
        raw: json["raw"] == null ? null : json["raw"],
        engtl: json["engtl"] == null ? null : json["engtl"],
        bw: json["bw"] == null ? null : json["bw"],
        amz: json["amz"] == null ? null : json["amz"],
        cdj: json["cdj"] == null ? null : json["cdj"],
        ebj: json["ebj"] == null ? null : json["ebj"],
        dj: json["dj"] == null ? null : json["dj"],
    );

    Map<String, dynamic> toJson() => {
        "al": al,
        "ap": ap,
        "kt": kt,
        "mu": mu,
        "nu": nu == null ? null : nu,
        "mal": mal,
        "raw": raw == null ? null : raw,
        "engtl": engtl == null ? null : engtl,
        "bw": bw == null ? null : bw,
        "amz": amz == null ? null : amz,
        "cdj": cdj == null ? null : cdj,
        "ebj": ebj == null ? null : ebj,
        "dj": dj == null ? null : dj,
    };
}

enum OriginalLanguage { KO, JA }

final originalLanguageValues = EnumValues({
    "ja": OriginalLanguage.JA,
    "ko": OriginalLanguage.KO
});

enum Status { ONGOING }

final statusValues = EnumValues({
    "ongoing": Status.ONGOING
});

class Tag {
    Tag({
        this.id,
        this.type,
        this.attributes,
    });

    String id;
    TagType type;
    TagAttributes attributes;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        type: tagTypeValues.map[json["type"]],
        attributes: TagAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": tagTypeValues.reverse[type],
        "attributes": attributes.toJson(),
    };
}

class TagAttributes {
    TagAttributes({
        this.name,
        this.description,
        this.group,
        this.version,
    });

    Title name;
    List<dynamic> description;
    Group group;
    int version;

    factory TagAttributes.fromJson(Map<String, dynamic> json) => TagAttributes(
        name: Title.fromJson(json["name"]),
        description: List<dynamic>.from(json["description"].map((x) => x)),
        group: groupValues.map[json["group"]],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "description": List<dynamic>.from(description.map((x) => x)),
        "group": groupValues.reverse[group],
        "version": version,
    };
}

enum Group { CONTENT, THEME, GENRE, FORMAT }

final groupValues = EnumValues({
    "content": Group.CONTENT,
    "format": Group.FORMAT,
    "genre": Group.GENRE,
    "theme": Group.THEME
});

enum TagType { TAG }

final tagTypeValues = EnumValues({
    "tag": TagType.TAG
});

enum DataType { MANGA }

final dataTypeValues = EnumValues({
    "manga": DataType.MANGA
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

enum RelationshipType { AUTHOR, ARTIST, COVER_ART }

final relationshipTypeValues = EnumValues({
    "artist": RelationshipType.ARTIST,
    "author": RelationshipType.AUTHOR,
    "cover_art": RelationshipType.COVER_ART
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
