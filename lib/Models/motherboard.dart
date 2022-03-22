// To parse this JSON data, do
//
//     final motherBoard = motherBoardFromJson(jsonString);

import 'dart:convert';

List<MotherBoard> motherBoardFromJson(String str) => List<MotherBoard>.from(json.decode(str).map((x) => MotherBoard.fromJson(x)));

String motherBoardToJson(List<MotherBoard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MotherBoard {
    MotherBoard({
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

    factory MotherBoard.fromJson(Map<String, dynamic> json) => MotherBoard(
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



