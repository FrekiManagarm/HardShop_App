// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'dart:convert';

List<Ram> ramFromJson(String str) => List<Ram>.from(json.decode(str).map((x) => Ram.fromJson(x)));

String ramToJson(List<Ram> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ram {
    Ram({
        this.id,
        this.image,
        this.capacit,
        this.ramInterface,
        this.latence,
        this.description,
        this.nom,
        this.quantit,
    });

    int? id;
    String? image;
    String? capacit;
    String? ramInterface;
    String? latence;
    String? description;
    String? nom;
    int? quantit;

    factory Ram.fromJson(Map<String, dynamic> json) => Ram(
        id: json["id"],
        image: json["image"],
        capacit: json["capacité"],
        ramInterface: json["interface"],
        latence: json["latence"],
        description: json["description"],
        nom: json["nom"],
        quantit: json["quantité"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "capacité": capacit,
        "interface": ramInterface,
        "latence": latence,
        "description": description,
        "nom": nom,
        "quantité": quantit,
    };
}


