import 'package:flutter/material.dart';
import 'package:hardshopapp/components/Background.dart';

class HomeConfigurator extends StatefulWidget {
  const HomeConfigurator({Key? key}) : super(key: key);

  @override
  _HomeConfiguratorState createState() => _HomeConfiguratorState();
}

class _HomeConfiguratorState extends State<HomeConfigurator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
          child: Column(
            children: const [
              Text(
                "Components List",
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
