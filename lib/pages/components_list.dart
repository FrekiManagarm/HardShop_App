import 'package:flutter/material.dart';
import 'package:hardshopapp/components/Background.dart';

class ComponentList extends StatefulWidget {
  const ComponentList({Key? key}) : super(key: key);

  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
          child: Column(
            children: const [
              Text(
                "Component List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
