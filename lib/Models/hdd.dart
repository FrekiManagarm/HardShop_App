// To parse this JSON data, do
//
//     final hdd = hddFromJson(jsonString);

import 'dart:convert';

List<Hdd> hddFromJson(String str) => List<Hdd>.from(json.decode(str).map((x) => Hdd.fromJson(x)));

String hddToJson(List<Hdd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hdd {
    Hdd({
        this.id,
        this.image,
        this.rpm,
        this.capacit,
        this.format,
        this.hddInterface,
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
    String? hddInterface;
    String? description;
    String? marque;
    int? mmoireCache;
    String? nom;
    String? transfert;

    factory Hdd.fromJson(Map<String, dynamic> json) => Hdd(
        id: json["id"],
        image: json["image"],
        rpm: json["RPM"],
        capacit: json["capacité"],
        format: json["format"],
        hddInterface: json["interface"],
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
        "interface": hddInterface,
        "description": description,
        "marque": marque,
        "mémoire_cache": mmoireCache,
        "nom": nom,
        "transfert": transfert,
    };
}

