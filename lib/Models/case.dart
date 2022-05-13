// To parse this JSON data, do
//
//     final boitier = boitierFromJson(jsonString);

import 'dart:convert';

List<Boitier> boitierFromJson(String str) =>
    List<Boitier>.from(json.decode(str).map((x) => Boitier.fromJson(x)));

String boitierToJson(List<Boitier> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Boitier {
  Boitier({
    required this.id,
    required this.image,
    required this.rgb,
    required this.alimInclus,
    required this.couleur,
    required this.description,
    required this.facadeLaterale,
    required this.format,
    required this.nom,
    required this.ventilateur,
  });

  int id;
  String image;
  int rgb;
  int alimInclus;
  String couleur;
  String description;
  String facadeLaterale;
  String format;
  String nom;
  int ventilateur;

  factory Boitier.fromJson(Map<String, dynamic> json) => Boitier(
        id: json["id"],
        image: json["image"],
        rgb: json["RGB"],
        alimInclus: json["alim_inclus"],
        couleur: json["couleur"],
        description: json["description"],
        facadeLaterale: json["facade_laterale"],
        format: json["format"],
        nom: json["nom"],
        ventilateur: json["ventilateur"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "RGB": rgb,
        "alim_inclus": alimInclus,
        "couleur": couleur,
        "description": description,
        "facade_laterale": facadeLaterale,
        "format": format,
        "nom": nom,
        "ventilateur": ventilateur,
      };
}
