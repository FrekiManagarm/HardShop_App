import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class GPUDetails extends StatelessWidget {
  const GPUDetails(
      {Key? key,
      required this.image,
      required this.nom,
      required this.frequence,
      required this.frequenceBoost,
      required this.nbCoeur,
      required this.nbVentilateur,
      required this.nbVideoOutput,
      this.description})
      : super(key: key);

  final String image;
  final String nom;
  final String frequence;
  final String frequenceBoost;
  final int nbCoeur;
  final int nbVentilateur;
  final int nbVideoOutput;
  final String? description;

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
                    top: 100.0,
                    left: 8,
                    right: 8,
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
