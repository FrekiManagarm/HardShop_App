import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class SSDDetails extends StatelessWidget {
  const SSDDetails(
      {Key? key,
      required this.capacit,
      required this.connectique,
      required this.ecriture,
      required this.format,
      required this.image,
      required this.lecture,
      required this.marque,
      required this.nom,
      required this.ssdInterface,
      this.description})
      : super(key: key);

  final String image;
  final int capacit;
  final String connectique;
  final String format;
  final String ssdInterface;
  final int lecture;
  final int ecriture;
  final String? description;
  final String marque;
  final String nom;

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
                    onPressed: () => Get.back(),
                    elevation: 16,
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
