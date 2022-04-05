// To parse this JSON data, do
//
//     final cooling = coolingFromJson(jsonString);

import 'dart:convert';

List<Cooling> coolingFromJson(String str) => List<Cooling>.from(json.decode(str).map((x) => Cooling.fromJson(x)));

String coolingToJson(List<Cooling> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cooling {
    Cooling({
        required this.id,
        required this.bruit,
        required this.format,
        required this.marque,
        required this.matriaux,
        required this.description,
        required this.nom,
        required this.socket,
        required this.type,
        required this.image,
    });

    int id;
    String bruit;
    String format;
    String marque;
    String matriaux;
    String description;
    String nom;
    String socket;
    String type;
    String image;

    factory Cooling.fromJson(Map<String, dynamic> json) => Cooling(
        id: json["id"],
        bruit: json["bruit"],
        format: json["format"],
        marque: json["marque"],
        matriaux: json["matériaux"],
        description: json["description"],
        nom: json["nom"],
        socket: json["socket"],
        type: json["type"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bruit": bruit,
        "format": format,
        "marque": marque,
        "matériaux": matriaux,
        "description": description,
        "nom": nom,
        "socket": socket,
        "type": type,
        "image": image,
    };
}

