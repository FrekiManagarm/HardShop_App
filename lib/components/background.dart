import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.red, Colors.amber],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: child,
    );
  }
}
