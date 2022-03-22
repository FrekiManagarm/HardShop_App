// To parse this JSON data, do
//
//     final psu = psuFromJson(jsonString);

import 'dart:convert';

List<Psu> psuFromJson(String str) => List<Psu>.from(json.decode(str).map((x) => Psu.fromJson(x)));

String psuToJson(List<Psu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Psu {
    Psu({
        this.id,
        this.image,
        this.certif,
        this.format,
        this.description,
        this.marque,
        this.modulaire,
        this.nom,
        this.puissance,
    });

    int? id;
    String? image;
    String? certif;
    String? format;
    String? description;
    String? marque;
    String? modulaire;
    String? nom;
    int? puissance;

    factory Psu.fromJson(Map<String, dynamic> json) => Psu(
        id: json["id"],
        image: json["image"],
        certif: json["certif"],
        format: json["format"],
        description: json["description"],
        marque: json["marque"],
        modulaire: json["modulaire"],
        nom: json["nom"],
        puissance: json["puissance"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "certif": certif,
        "format": format,
        "description": description,
        "marque": marque,
        "modulaire": modulaire,
        "nom": nom,
        "puissance": puissance,
    };
}

