import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Stack Header() {
    return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 45.0,
                  right: 8,
                  left: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://i.imgur.com/PLyEnDt.jpg',
                  ),
                ),
              ),
              const Positioned(
                child: Center(
                  child: Text(
                    'Mémoire Vive',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50.0,
                child: MaterialButton(
                  elevation: 16.0,
                  onPressed: () => Get.back(),
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
  }