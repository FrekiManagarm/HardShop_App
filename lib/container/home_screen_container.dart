import 'package:flutter/material.dart';

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({Key? key}) : super(key: key);

  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Icon(Icons.adaptive.arrow_forward_outlined),
      ),
    );
  }
}
