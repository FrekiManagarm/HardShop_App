import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HardShop App'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Coucou"),
            Text("tout le monde")
          ]
        ),
      ),
    );
  }
}