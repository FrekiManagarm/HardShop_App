import 'package:flutter/material.dart';
import 'package:hardshopapp/components/Background.dart';
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
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Cpu cpu = snapshot.data![index];
                            return (
                              ListTile(
                                leading: Image.network(cpu.image),
                                title: Text(cpu.nom),
                                subtitle: Text(cpu.architecture),
                              )
                            );
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
