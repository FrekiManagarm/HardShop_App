import 'package:flutter/material.dart';
import 'package:hardshopapp/components/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Background(
            child: Column(
              children: [
                
              ],
            ),
          ),
        ),
    );
  }
}
