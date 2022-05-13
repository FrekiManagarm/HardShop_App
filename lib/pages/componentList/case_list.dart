import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/Models/case.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/case_details.dart';

class CaseList extends StatefulWidget {
  const CaseList({Key? key}) : super(key: key);

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  Future<List<Boitier>>? _cases;

  @override
  void initState() {
    super.initState();
    _cases = Network.getCase();
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
                child: FutureBuilder<List<Boitier>>(
                  future: _cases,
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
                              top: 10,
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
                                Boitier boitier = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  openBuilder: (context, action) {
                                    return CaseDetails(
                                      alimInclus: boitier.alimInclus,
                                      couleur: boitier.couleur,
                                      facadeLaterale: boitier.facadeLaterale,
                                      format: boitier.format,
                                      image: boitier.image,
                                      nom: boitier.nom,
                                      rgb: boitier.rgb,
                                      ventilateur: boitier.ventilateur,
                                      description: boitier.description,
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
                                            child: Image.network(boitier.image),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            boitier.nom,
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
