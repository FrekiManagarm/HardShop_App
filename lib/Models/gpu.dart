// To parse this JSON data, do
//
//     final gpu = gpuFromJson(jsonString);

import 'dart:convert';

Gpu gpuFromJson(String str) => Gpu.fromJson(json.decode(str));

String gpuToJson(Gpu data) => json.encode(data.toJson());

class Gpu {
    Gpu({
        required this.data,
    });

    List<Datum> data;

    factory Gpu.fromJson(Map<String, dynamic> json) => Gpu(
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
        this.nom,
        this.frequence,
        this.frequenceBoost,
        this.nbCoeur,
        this.nbVentilateur,
        this.nbVideoOutput,
        this.description,
    });

    int? id;
    String? image;
    String? nom;
    String? frequence;
    String? frequenceBoost;
    int? nbCoeur;
    int? nbVentilateur;
    int? nbVideoOutput;
    String? description;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        nom: json["nom"],
        frequence: json["frequence"],
        frequenceBoost: json["frequence_boost"],
        nbCoeur: json["nb_coeur"],
        nbVentilateur: json["nb_ventilateur"],
        nbVideoOutput: json["nb_video_output"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "nom": nom,
        "frequence": frequence,
        "frequence_boost": frequenceBoost,
        "nb_coeur": nbCoeur,
        "nb_ventilateur": nbVentilateur,
        "nb_video_output": nbVideoOutput,
        "description": description,
    };
}
