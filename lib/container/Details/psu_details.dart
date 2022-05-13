import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class PSUDetails extends StatelessWidget {
  const PSUDetails({
    Key? key,
    required this.certif,
    required this.format,
    required this.image,
    required this.marque,
    required this.modulaire,
    required this.nom,
    required this.puissance,
    this.description,
  }) : super(key: key);

  final String image;
  final String certif;
  final String format;
  final String? description;
  final String marque;
  final String modulaire;
  final String nom;
  final int puissance;

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
                ),
                Positioned(
                  top: 40,
                  child: MaterialButton(
                    elevation: 16,
                    onPressed: () => Get.back(),
                    color: Colors.amber,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Nom : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              nom,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
