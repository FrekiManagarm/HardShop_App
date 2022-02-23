import 'package:flutter/material.dart';

class ComponentsGridView extends StatelessWidget {
  const ComponentsGridView({Key? key, required this.count, required this.child }) : super(key: key);

  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      itemBuilder: (BuildContext ctx, index) {
        return child;
      }, 
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
    );
  }
}
