import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Image.network(image),
          ),
          Positioned(
            top: 40.0,
            child: MaterialButton(
              elevation: 16.0,
              onPressed: () => Navigator.pop(context),
              color: Colors.amber,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
