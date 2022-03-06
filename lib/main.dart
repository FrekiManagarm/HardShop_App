import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/controllers/maincontroller.dart';
import 'package:hardshopapp/pages/components_list.dart';
import 'package:hardshopapp/pages/dashboard/dashboard.dart';
import 'package:hardshopapp/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HardShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MainController()),
        GetPage(name: '/components', page: () => const ComponentList()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
      ],
    );
  }
}
