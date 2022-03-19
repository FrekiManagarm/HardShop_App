// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

SSD ramFromJson(String str) => SSD.fromJson(json.decode(str));

String ramToJson(SSD data) => json.encode(data.toJson());

class SSD {
    SSD({
        required this.data,
    });

    List<Datum> data;

    factory SSD.fromJson(Map<String, dynamic> json) => SSD(
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
        this.capacit,
        this.connectique,
        this.format,
        this.datumInterface,
        this.lecture,
        this.ecriture,
        this.description,
        this.marque,
        this.nom,
    });

    int? id;
    String? image;
    int? capacit;
    String? connectique;
    String? format;
    String? datumInterface;
    int? lecture;
    int? ecriture;
    String? description;
    String? marque;
    String? nom;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        capacit: json["capacité"],
        connectique: json["connectique"],
        format: json["format"],
        datumInterface: json["interface"],
        lecture: json["lecture"],
        ecriture: json["ecriture"],
        description: json["description"],
        marque: json["marque"],
        nom: json["nom"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "capacité": capacit,
        "connectique": connectique,
        "format": format,
        "interface": datumInterface,
        "lecture": lecture,
        "ecriture": ecriture,
        "description": description,
        "marque": marque,
        "nom": nom,
    };
}


