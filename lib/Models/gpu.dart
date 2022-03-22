// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'dart:convert';

List<Gpu> cpuFromJson(String str) => List<Gpu>.from(json.decode(str).map((x) => Gpu.fromJson(x)));

String cpuToJson(List<Gpu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gpu {
    Gpu({
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

    factory Gpu.fromJson(Map<String, dynamic> json) => Gpu(
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

