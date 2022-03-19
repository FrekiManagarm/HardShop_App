// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

HDD ramFromJson(String str) => HDD.fromJson(json.decode(str));

String ramToJson(HDD data) => json.encode(data.toJson());

class HDD {
    HDD({
        required this.data,
    });

    List<Datum> data;

    factory HDD.fromJson(Map<String, dynamic> json) => HDD(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.image,
        this.rpm,
        this.capacit,
        this.format,
        this.datumInterface,
        this.description,
        this.marque,
        this.mmoireCache,
        this.nom,
        this.transfert,
    });

    int? id;
    String? image;
    int? rpm;
    int? capacit;
    String? format;
    String? datumInterface;
    String? description;
    String? marque;
    int? mmoireCache;
    String? nom;
    String? transfert;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        rpm: json["RPM"],
        capacit: json["capacité"],
        format: json["format"],
        datumInterface: json["interface"],
        description: json["description"],
        marque: json["marque"],
        mmoireCache: json["mémoire_cache"],
        nom: json["nom"],
        transfert: json["transfert"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "RPM": rpm,
        "capacité": capacit,
        "format": format,
        "interface": datumInterface,
        "description": description,
        "marque": marque,
        "mémoire_cache": mmoireCache,
        "nom": nom,
        "transfert": transfert,
    };
}
