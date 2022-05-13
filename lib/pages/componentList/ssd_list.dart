import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/Models/psu.dart';
import 'package:hardshopapp/Models/ssd.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/ssd_details.dart';

class SSDList extends StatefulWidget {
  const SSDList({Key? key}) : super(key: key);

  @override
  State<SSDList> createState() => _SSDListState();
}

class _SSDListState extends State<SSDList> {
  Future<List<Ssd>>? _ssds;

  @override
  void initState() {
    super.initState();
    _ssds = Network.getSSD();
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
                child: FutureBuilder<List<Ssd>>(
                  future: _ssds,
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
                              top: 50,
                              left: 8,
                              right: 8,
                              bottom: 8,
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Ssd ssd = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  openBuilder: (context, action) {
                                    return SSDDetails(
                                      capacit: ssd.capacit,
                                      connectique: ssd.connectique,
                                      ecriture: ssd.ecriture,
                                      format: ssd.format,
                                      image: ssd.image,
                                      lecture: ssd.lecture,
                                      marque: ssd.marque,
                                      nom: ssd.nom,
                                      ssdInterface: ssd.ssdInterface,
                                      description: ssd.description,
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
                                            child: Image.network(ssd.image),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            ssd.nom,
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
