// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

MotherBoard ramFromJson(String str) => MotherBoard.fromJson(json.decode(str));

String ramToJson(MotherBoard data) => json.encode(data.toJson());

class MotherBoard {
    MotherBoard({
        required this.data,
    });

    List<Datum> data;

    factory MotherBoard.fromJson(Map<String, dynamic> json) => MotherBoard(
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
        this.constructeur,
        this.format,
        this.frquenceMmoire,
        this.description,
        this.nom,
        this.procoCompatible,
        this.socket,
    });

    int? id;
    String? image;
    String? constructeur;
    String? format;
    String? frquenceMmoire;
    String? description;
    String? nom;
    String? procoCompatible;
    String? socket;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        constructeur: json["constructeur"],
        format: json["format"],
        frquenceMmoire: json["fréquence_mémoire"],
        description: json["description"],
        nom: json["nom"],
        procoCompatible: json["proco_compatible"],
        socket: json["socket"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "constructeur": constructeur,
        "format": format,
        "fréquence_mémoire": frquenceMmoire,
        "description": description,
        "nom": nom,
        "proco_compatible": procoCompatible,
        "socket": socket,
    };
}


