import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/Background.dart';
import 'package:hardshopapp/pages/componentList/case_list.dart';
import 'package:hardshopapp/pages/componentList/cooling_list.dart';
import 'package:hardshopapp/pages/componentList/cpu_list.dart';
import 'package:hardshopapp/pages/componentList/gpu_list.dart';
import 'package:hardshopapp/pages/componentList/hdd_list.dart';
import 'package:hardshopapp/pages/componentList/motherboard_list.dart';
import 'package:hardshopapp/pages/componentList/psu_list.dart';
import 'package:hardshopapp/pages/componentList/ram_list.dart';
import 'package:hardshopapp/pages/componentList/ssd_list.dart';

class ComponentList extends StatefulWidget {
  const ComponentList({Key? key}) : super(key: key);

  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  List categories = [
    'Processeur',
    'Carte Graphique',
    'Refroidissement',
    'Disque Dur',
    'Disque SSD',
    'Carte Mère',
    'Mémoire Vive',
    'Alimentation',
    'Boîtier'
  ];

  List routes = [
    '/components/cpu',
    '/components/gpu',
    '/components/cooling',
    '/components/hdd',
    '/components/ssd',
    '/components/motherboard',
    '/components/ram',
    '/components/psu',
    '/components/case'
  ];

  List<Widget> listWidgets = [
    const CPUList(),
    const GPUList(),
    const CoolingList(),
    const HDDList(),
    const SSDList(),
    const MotherBoardList(),
    const RAMList(),
    const PSUList(),
    const CaseList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
            child: Column(
          children: [
            Stack(
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
              ],
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 8, left: 8, bottom: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(routes[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.25,
                              ),
                              spreadRadius: 3,
                              blurRadius: 3,
                              // offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(150),
                                  child: Image.network(
                                    'https://i.imgur.com/PLyEnDt.jpg',
                                    height: 150.0,
                                    width: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
