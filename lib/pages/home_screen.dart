import 'package:flutter/material.dart';
import 'package:hardshopapp/components/avatar_container.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/container/home_screen_container.dart';

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
      body: SafeArea(
        child: Center(
          child: Background(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.adaptive.arrow_forward_outlined),
                ),
                Switch.adaptive(
                    value: _isCheck,
                    onChanged: (bool newValue) {
                      setState(() {
                        _isCheck = newValue;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
