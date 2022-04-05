import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/Models/hdd.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/hdd_details.dart';

class HDDList extends StatefulWidget {
  const HDDList({Key? key}) : super(key: key);

  @override
  State<HDDList> createState() => _HDDListState();
}

class _HDDListState extends State<HDDList> {
  Future<List<Hdd>>? _hdds;

  @override
  void initState() {
    super.initState();
    _hdds = Network.getHDD();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
          child: Column(
            children: [
              Header(),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: FutureBuilder<List<Hdd>>(
                  future: _hdds,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator.adaptive();
                      default:
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 8, left: 8, bottom: 8),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Hdd hdd = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  openBuilder: (context, action) {
                                    return HDDDetails(
                                      capacit: hdd.capacit,
                                      format: hdd.format,
                                      hddInterface: hdd.hddInterface,
                                      image: hdd.image,
                                      marque: hdd.marque,
                                      mmoireCache: hdd.mmoireCache,
                                      nom: hdd.nom,
                                      rpm: hdd.rpm,
                                      transfert: hdd.transfert,
                                      description: hdd.description,
                                    );
                                  },
                                  closedBuilder: (context, action) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Image.network(hdd.image),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            hdd.nom,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
