import 'package:flutter/material.dart';
import 'package:hardshopapp/components/background.dart';

class CaseDetails extends StatelessWidget {
  const CaseDetails(
      {Key? key,
      required this.image,
      required this.alimInclus,
      required this.couleur,
      required this.facadeLaterale,
      required this.format,
      required this.nom,
      required this.rgb,
      required this.ventilateur,
      this.description})
      : super(key: key);

  final String image;
  final int rgb;
  final int alimInclus;
  final String couleur;
  final String? description;
  final String facadeLaterale;
  final String format;
  final String nom;
  final int ventilateur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    left: 8,
                    right: 8,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(image),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
