import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/components/Background.dart';
import 'package:hardshopapp/container/Details/cpu_details.dart';
import '../api/network.dart';
import '../Models/cpu.dart';

class ComponentList extends StatefulWidget {
  const ComponentList({Key? key}) : super(key: key);

  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  Future<List<Cpu>>? _cpus;

  @override
  void initState() {
    super.initState();
    _cpus = CPUNetwork.getCPU();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: FutureBuilder<List<Cpu>>(
              future: _cpus,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Cpu>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
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
                              closedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              // transitionDuration: const Duration(seconds: 1),
                              transitionType:
                                  ContainerTransitionType.fadeThrough,
                              closedBuilder: (context, action) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
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
                                      ),
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
                          });
                    }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
