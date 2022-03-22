// To parse this JSON data, do
//
//     final ssd = ssdFromJson(jsonString);

import 'dart:convert';

List<Ssd> ssdFromJson(String str) => List<Ssd>.from(json.decode(str).map((x) => Ssd.fromJson(x)));

String ssdToJson(List<Ssd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ssd {
    Ssd({
        this.id,
        this.image,
        this.capacit,
        this.connectique,
        this.format,
        this.ssdInterface,
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
    String? ssdInterface;
    int? lecture;
    int? ecriture;
    String? description;
    String? marque;
    String? nom;

    factory Ssd.fromJson(Map<String, dynamic> json) => Ssd(
        id: json["id"],
        image: json["image"],
        capacit: json["capacité"],
        connectique: json["connectique"],
        format: json["format"],
        ssdInterface: json["interface"],
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
        "interface": ssdInterface,
        "lecture": lecture,
        "ecriture": ecriture,
        "description": description,
        "marque": marque,
        "nom": nom,
    };
}



