// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

Ram ramFromJson(String str) => Ram.fromJson(json.decode(str));

String ramToJson(Ram data) => json.encode(data.toJson());

class Ram {
    Ram({
        required this.data,
    });

    List<Datum> data;

    factory Ram.fromJson(Map<String, dynamic> json) => Ram(
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
        this.datumInterface,
        this.latence,
        this.description,
        this.nom,
        this.quantit,
    });

    int? id;
    String? image;
    String? capacit;
    String? datumInterface;
    String? latence;
    String? description;
    String? nom;
    int? quantit;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        capacit: json["capacité"],
        datumInterface: json["interface"],
        latence: json["latence"],
        description: json["description"],
        nom: json["nom"],
        quantit: json["quantité"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "capacité": capacit,
        "interface": datumInterface,
        "latence": latence,
        "description": description,
        "nom": nom,
        "quantité": quantit,
    };
}

