import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class CoolingDetails extends StatelessWidget {
  const CoolingDetails(
      {Key? key,
      required this.bruit,
      required this.nom,
      required this.format,
      required this.image,
      required this.marque,
      required this.matriaux,
      required this.socket,
      required this.type,
      this.description})
      : super(key: key);

  final String bruit;
  final String format;
  final String marque;
  final String matriaux;
  final String? description;
  final String nom;
  final String socket;
  final String type;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
                  child: ClipRRect(
                    child: Image.network(image),
                    borderRadius: BorderRadius.circular(16),
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
            )
          ],
        ),
      ),
    );
  }
}
