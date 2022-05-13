import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/Models/psu.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/psu_details.dart';

class PSUList extends StatefulWidget {
  const PSUList({Key? key}) : super(key: key);

  @override
  State<PSUList> createState() => _PSUListState();
}

class _PSUListState extends State<PSUList> {
  Future<List<Psu>>? _psus;

  @override
  void initState() {
    super.initState();
    _psus = Network.getPSU();
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
                child: FutureBuilder<List<Psu>>(
                  future: _psus,
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
                                      mainAxisSpacing: 15),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Psu psu = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  // closedShape: ,
                                  openBuilder: (context, action) {
                                    return PSUDetails(
                                      certif: psu.certif,
                                      format: psu.format,
                                      image: psu.image,
                                      marque: psu.marque,
                                      modulaire: psu.modulaire,
                                      puissance: psu.puissance,
                                      nom: psu.nom,
                                      description: psu.description,
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
                                            child: Image.network(psu.image),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            psu.nom,
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
