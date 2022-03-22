// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'dart:convert';

List<Cpu> cpuFromJson(String str) => List<Cpu>.from(json.decode(str).map((x) => Cpu.fromJson(x)));

String cpuToJson(List<Cpu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cpu {
    Cpu({
        required this.id,
        required this.nom,
        required this.image,
        required this.architecture,
        required this.cache,
        required this.chipset,
        required this.chipsetGraphique,
        required this.frequence,
        required this.frequenceBoost,
        required this.nbCoeur,
        required this.nbThreads,
        required this.description,
        required this.overclocking,
        required this.socket,
        required this.type,
    });

    int id;
    String nom;
    String image;
    String architecture;
    String cache;
    String chipset;
    String chipsetGraphique;
    String frequence;
    String frequenceBoost;
    int nbCoeur;
    int nbThreads;
    String description;
    int overclocking;
    String socket;
    String type;

    factory Cpu.fromJson(Map<String, dynamic> json) => Cpu(
        id: json["id"],
        nom: json["nom"],
        image: json["image"],
        architecture: json["architecture"],
        cache: json["cache"],
        chipset: json["chipset"],
        chipsetGraphique: json["chipset_graphique"],
        frequence: json["frequence"],
        frequenceBoost: json["frequence_boost"],
        nbCoeur: json["nb_coeur"],
        nbThreads: json["nb_threads"],
        description: json["description"],
        overclocking: json["overclocking"],
        socket: json["socket"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "image": image,
        "architecture": architecture,
        "cache": cache,
        "chipset": chipset,
        "chipset_graphique": chipsetGraphique,
        "frequence": frequence,
        "frequence_boost": frequenceBoost,
        "nb_coeur": nbCoeur,
        "nb_threads": nbThreads,
        "description": description,
        "overclocking": overclocking,
        "socket": socket,
        "type": type,
    };
}

