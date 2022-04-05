import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/Models/cooling.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/cooling_details.dart';

class CoolingList extends StatefulWidget {
  const CoolingList({Key? key}) : super(key: key);

  @override
  State<CoolingList> createState() => _CoolingListState();
}

class _CoolingListState extends State<CoolingList> {
  Future<List<Cooling>>? _coolings;

  @override
  void initState() {
    super.initState();
    _coolings = Network.getCooling();
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
                child: FutureBuilder<List<Cooling>>(
                  future: _coolings,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator.adaptive();
                      default:
                        if (snapshot.hasError) {
                          return Text(
                            snapshot.error.toString(),
                          );
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
                                Cooling cooling = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  openBuilder: (context, action) {
                                    return CoolingDetails(
                                      bruit: cooling.bruit,
                                      format: cooling.format,
                                      marque: cooling.marque,
                                      image: cooling.image,
                                      matriaux: cooling.matriaux,
                                      nom: cooling.nom,
                                      socket: cooling.socket,
                                      type: cooling.type,
                                      description: cooling.description,
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
                                            child: Image.network(
                                              cooling.image,
                                              height: 150.0,
                                              width: 150.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            cooling.nom,
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
