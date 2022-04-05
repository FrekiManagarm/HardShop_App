import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/container/Details/cpu_details.dart';
import '../../Models/cpu.dart';
import '../../api/network.dart';
import '../../components/header.dart';

class CPUList extends StatefulWidget {
  const CPUList({Key? key}) : super(key: key);

  @override
  State<CPUList> createState() => _CPUListState();
}

class _CPUListState extends State<CPUList> {
  Future<List<Cpu>>? _cpus;

  @override
  void initState() {
    super.initState();
    _cpus = Network.getCPU();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
            child: Column(
          children: [
            Header(), // Image de présentation avec croix pour fermer
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FutureBuilder<List<Cpu>>(
                future: _cpus,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Cpu>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator.adaptive();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
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
                              Cpu cpu = snapshot.data![index];
                              return (OpenContainer(
                                closedElevation: 8.0,
                                closedBuilder: (context, action) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Image.network(
                                            cpu.image,
                                            height: 150.0,
                                            width: 150.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          cpu.nom,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                openBuilder: (context, action) {
                                  return CPUDetails(
                                    architecture: cpu.architecture,
                                    cache: cpu.cache,
                                    frequence: cpu.frequence,
                                    frequenceBoost: cpu.frequenceBoost,
                                    image: cpu.image,
                                    nbCoeur: cpu.nbCoeur,
                                    nbThreads: cpu.nbThreads,
                                    nom: cpu.nom,
                                    overclocking: cpu.overclocking,
                                    type: cpu.type,
                                    socket: cpu.socket,
                                    chipset: cpu.chipset,
                                    chipsetGraphique: cpu.chipsetGraphique,
                                    description: cpu.description,
                                  );
                                },
                              ));
                            },
                          ),
                        );
                      }
                  }
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
