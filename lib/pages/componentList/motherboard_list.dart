import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/Models/motherboard.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/motherboard_details.dart';

class MotherBoardList extends StatefulWidget {
  const MotherBoardList({Key? key}) : super(key: key);

  @override
  State<MotherBoardList> createState() => _MotherBoardListState();
}

class _MotherBoardListState extends State<MotherBoardList> {
  Future<List<MotherBoard>>? _motherboards;

  @override
  void initState() {
    super.initState();
    _motherboards = Network.getMotherBoard();
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
                child: FutureBuilder<List<MotherBoard>>(
                  future: _motherboards,
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
                                      mainAxisSpacing: 15),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                MotherBoard motherBoard = snapshot.data![index];
                                return OpenContainer(
                                  closedElevation: 8,
                                  openBuilder: (context, action) {
                                    return MotherBoardDetails(
                                      constructeur: motherBoard.constructeur,
                                      format: motherBoard.format,
                                      frquenceMmoire: motherBoard.frquenceMmoire,
                                      image: motherBoard.image,
                                      nom: motherBoard.nom,
                                      procoCompatible: motherBoard.procoCompatible,
                                      socket: motherBoard.socket,
                                      description: motherBoard.description,
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
                                              motherBoard.image,
                                              height: 150,
                                              width: 150,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            motherBoard.nom,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
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
