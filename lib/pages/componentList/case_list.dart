import 'package:flutter/material.dart';
import 'package:hardshopapp/components/background.dart';
import 'package:hardshopapp/components/header.dart';

class CaseList extends StatefulWidget {
  const CaseList({ Key? key }) : super(key: key);

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
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