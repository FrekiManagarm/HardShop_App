import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hardshopapp/controllers/maincontroller.dart';
import 'package:hardshopapp/pages/componentList/case_list.dart';
import 'package:hardshopapp/pages/componentList/cooling_list.dart';
import 'package:hardshopapp/pages/componentList/cpu_list.dart';
import 'package:hardshopapp/pages/componentList/gpu_list.dart';
import 'package:hardshopapp/pages/componentList/hdd_list.dart';
import 'package:hardshopapp/pages/componentList/motherboard_list.dart';
import 'package:hardshopapp/pages/componentList/psu_list.dart';
import 'package:hardshopapp/pages/componentList/ram_list.dart';
import 'package:hardshopapp/pages/componentList/ssd_list.dart';
import 'package:hardshopapp/pages/components_list.dart';
import 'package:hardshopapp/pages/configurator/home_config.dart';
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
        GetPage(name: '/components/cpu', page: () => const CPUList()),
        GetPage(name: '/components/gpu', page: () => const GPUList()),
        GetPage(name: '/components/ram', page: () => const RAMList()),
        GetPage(name: '/components/case', page: () => const CaseList()),
        GetPage(name: '/components/motherboard', page: () => const MotherBoardList()),
        GetPage(name: '/components/psu', page: () => const PSUList()),
        GetPage(name: '/components/ssd', page: () => const SSDList()),
        GetPage(name: '/components/hdd', page: () => const HDDList()),
        GetPage(name: '/components/cooling', page: () => const CoolingList()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
        GetPage(name: '/configurator', page: () => const HomeConfigurator()),
      ],
    );
  }
}
