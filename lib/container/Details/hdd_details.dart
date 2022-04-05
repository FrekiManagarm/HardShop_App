import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';

class HDDDetails extends StatelessWidget {
  const HDDDetails({
    Key? key,
    required this.capacit,
    this.description,
    required this.format,
    required this.hddInterface,
    required this.image,
    required this.marque,
    required this.mmoireCache,
    required this.nom,
    required this.rpm,
    required this.transfert,
  }) : super(key: key);

  final String image;
  final int rpm;
  final int capacit;
  final String format;
  final String hddInterface;
  final String? description;
  final String marque;
  final int mmoireCache;
  final String nom;
  final String transfert;

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
                    child: const Icon(
                      Icons.close,
                    ),
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
