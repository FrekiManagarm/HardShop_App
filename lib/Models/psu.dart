// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

PSU ramFromJson(String str) => PSU.fromJson(json.decode(str));

String ramToJson(PSU data) => json.encode(data.toJson());

class PSU {
    PSU({
        required this.data,
    });

    List<Datum> data;

    factory PSU.fromJson(Map<String, dynamic> json) => PSU(
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
