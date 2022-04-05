import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/Models/gpu.dart';
import 'package:hardshopapp/api/network.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';
import 'package:hardshopapp/container/Details/gpu_details.dart';

class GPUList extends StatefulWidget {
  const GPUList({Key? key}) : super(key: key);

  @override
  State<GPUList> createState() => _GPUListState();
}

class _GPUListState extends State<GPUList> {
  Future<List<Gpu>>? _gpus;

  @override
  void initState() {
    super.initState();
    _gpus = Network.getGPU();
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
                child: FutureBuilder<List<Gpu>>(
                  future: _gpus,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Gpu>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator.adaptive();
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 50.0,
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
                                Gpu gpu = snapshot.data![index];
                                return (OpenContainer(
                                  closedElevation: 8.0,
                                  openBuilder: (context, action) {
                                    return GPUDetails(
                                      image: gpu.image,
                                      frequence: gpu.frequence,
                                      nom: gpu.nom,
                                      frequenceBoost: gpu.frequenceBoost,
                                      nbCoeur: gpu.nbCoeur,
                                      nbVentilateur: gpu.nbVentilateur,
                                      nbVideoOutput: gpu.nbVideoOutput,
                                      description: gpu.description,
                                    );
                                  },
                                  closedBuilder: (context, action) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Image.network(gpu.image),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            gpu.nom,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ],
                                      ),
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
          ),
        ),
      ),
    );
  }
}
