// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'dart:convert';

Cpu cpuFromJson(String str) => Cpu.fromJson(json.decode(str));

String cpuToJson(Cpu data) => json.encode(data.toJson());

class Cpu {
    Cpu({
        required this.data,
    });

    List<Datum> data;

    factory Cpu.fromJson(Map<String, dynamic> json) => Cpu(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.nom,
        this.image,
        this.architecture,
        this.cache,
        this.chipset,
        this.chipsetGraphique,
        this.frequence,
        this.frequenceBoost,
        this.nbCoeur,
        this.nbThreads,
        this.description,
        this.overclocking,
        this.socket,
        this.type,
    });

    int? id;
    String? nom;
    String? image;
    String? architecture;
    String? cache;
    String? chipset;
    String? chipsetGraphique;
    String? frequence;
    String? frequenceBoost;
    int? nbCoeur;
    int? nbThreads;
    String? description;
    int? overclocking;
    String? socket;
    String? type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
