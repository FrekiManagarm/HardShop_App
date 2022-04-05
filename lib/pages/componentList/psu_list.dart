import 'package:flutter/material.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';

class PSUList extends StatefulWidget {
  const PSUList({Key? key}) : super(key: key);

  @override
  State<PSUList> createState() => _PSUListState();
}

class _PSUListState extends State<PSUList> {
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
