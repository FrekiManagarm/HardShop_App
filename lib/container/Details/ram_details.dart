import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class RamDetails extends StatelessWidget {
  const RamDetails({
    Key? key,
    required this.image,
    required this.nom,
    required this.capacit,
    required this.latence,
    required this.quantit,
    required this.ramInterface,
    this.description,
  }) : super(key: key);

  final String image;
  final String capacit;
  final String ramInterface;
  final String latence;
  final String? description;
  final String nom;
  final int quantit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 8, right: 8),
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
              'Nom : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
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
