// To parse this JSON data, do
//
//     final boitier = boitierFromJson(jsonString);

import 'dart:convert';

Boitier boitierFromJson(String str) => Boitier.fromJson(json.decode(str));

String boitierToJson(Boitier data) => json.encode(data.toJson());

class Boitier {
    Boitier({
        required this.data,
    });

    List<Datum> data;

    factory Boitier.fromJson(Map<String, dynamic> json) => Boitier(
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
        this.rgb,
        this.alimInclus,
        this.couleur,
        this.description,
        this.facadeLaterale,
        this.format,
        this.nom,
        this.ventilateur,
    });

    int? id;
    String? image;
    int? rgb;
    int? alimInclus;
    String? couleur;
    String? description;
    String? facadeLaterale;
    String? format;
    String? nom;
    int? ventilateur;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        rgb: json["RGB"],
        alimInclus: json["alim_inclus"],
        couleur: json["couleur"],
        description: json["description"],
        facadeLaterale: json["facade_laterale"],
        format: json["format"],
        nom: json["nom"],
        ventilateur: json["ventilateur"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "RGB": rgb,
        "alim_inclus": alimInclus,
        "couleur": couleur,
        "description": description,
        "facade_laterale": facadeLaterale,
        "format": format,
        "nom": nom,
        "ventilateur": ventilateur,
    };
}
