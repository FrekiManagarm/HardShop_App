// To parse this JSON data, do
//
//     final cooling = coolingFromJson(jsonString);

import 'dart:convert';

Cooling coolingFromJson(String str) => Cooling.fromJson(json.decode(str));

String coolingToJson(Cooling data) => json.encode(data.toJson());

class Cooling {
    Cooling({
        required this.data,
    });

    List<Datum> data;

    factory Cooling.fromJson(Map<String, dynamic> json) => Cooling(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.bruit,
        this.format,
        this.marque,
        this.matriaux,
        this.description,
        this.nom,
        this.socket,
        this.type,
        this.image,
    });

    int? id;
    String? bruit;
    String? format;
    String? marque;
    String? matriaux;
    String? description;
    String? nom;
    String? socket;
    String? type;
    String? image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

