import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/Models/ram.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/ram_details.dart';

class RAMList extends StatefulWidget {
  const RAMList({Key? key}) : super(key: key);

  @override
  State<RAMList> createState() => _RAMListState();
}

class _RAMListState extends State<RAMList> {
  Future<List<Ram>>? _rams;

  @override
  void initState() {
    super.initState();
    _rams = Network.getRAM();
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
                child: FutureBuilder<List<Ram>>(
                  future: _rams,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ram>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator.adaptive();
                      default:
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 8.0,
                              right: 8.0,
                              bottom: 8.0,
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
                                Ram ram = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8.0,
                                  closedShape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24.0),
                                    ),
                                  ),
                                  openBuilder: (context, action) {
                                    return RamDetails(
                                      capacit: ram.capacit,
                                      image: ram.image,
                                      quantit: ram.quantit,
                                      latence: ram.latence,
                                      nom: ram.nom,
                                      ramInterface: ram.ramInterface,
                                      description: ram.description,
                                    );
                                  },
                                  closedBuilder: (context, action) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Image.network(
                                              ram.image,
                                              height: 150.0,
                                              width: 150.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            ram.nom,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
