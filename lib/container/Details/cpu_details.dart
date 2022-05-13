import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CPUDetails extends StatelessWidget {
  const CPUDetails(
      {Key? key,
      required this.architecture,
      required this.nom,
      required this.cache,
      this.chipset,
      this.chipsetGraphique,
      required this.frequence,
      required this.frequenceBoost,
      required this.nbCoeur,
      required this.image,
      required this.nbThreads,
      this.description,
      required this.overclocking,
      required this.socket,
      required this.type})
      : super(key: key);

  final String architecture;
  final String nom;
  final String image;
  final String cache;
  final String? chipset;
  final String? chipsetGraphique;
  final String frequence;
  final String frequenceBoost;
  final int nbCoeur;
  final int nbThreads;
  final String? description;
  final int overclocking;
  final String socket;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 8, left: 8),
                child: ClipRRect(
                  child: Image.network(image),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                top: 40.0,
                child: MaterialButton(
                  elevation: 16.0,
                  onPressed: () => Get.back(),
                  color: Colors.amber,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.close,
                    // color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Nom : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            nom,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
