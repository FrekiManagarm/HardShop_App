import 'package:flutter/material.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';

class SSDList extends StatefulWidget {
  const SSDList({ Key? key }) : super(key: key);

  @override
  State<SSDList> createState() => _SSDListState();
}

class _SSDListState extends State<SSDList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Background(
          child: Column(
            children: [
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}