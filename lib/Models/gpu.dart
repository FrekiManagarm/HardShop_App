// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'dart:convert';

List<Gpu> gpuFromJson(String str) => List<Gpu>.from(json.decode(str).map((x) => Gpu.fromJson(x)));

String gpuToJson(List<Gpu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gpu {
    Gpu({
        required this.id,
        required this.image,
        required this.nom,
        required this.frequence,
        required this.frequenceBoost,
        required this.nbCoeur,
        required this.nbVentilateur,
        required this.nbVideoOutput,
        required this.description,
    });

    int id;
    String image;
    String nom;
    String frequence;
    String frequenceBoost;
    int nbCoeur;
    int nbVentilateur;
    int nbVideoOutput;
    String description;

    factory Gpu.fromJson(Map<String, dynamic> json) => Gpu(
        id: json["id"],
        image: json["image"],
        nom: json["nom"],
        frequence: json["frequence"],
        frequenceBoost: json["frequence_boost"],
        nbCoeur: json["nb_coeur"],
        nbVentilateur: json["nb_ventilateurs"],
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
        "nb_ventilateurs": nbVentilateur,
        "nb_video_output": nbVideoOutput,
        "description": description,
    };
}

