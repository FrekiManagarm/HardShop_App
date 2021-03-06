import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hardshopapp/pages/components_list.dart';
import 'package:hardshopapp/pages/configurator/home_config.dart';
import 'package:hardshopapp/pages/dashboard/dashboard.dart';
import 'package:hardshopapp/pages/home_screen.dart';

class MainController extends StatefulWidget {
  const MainController({Key? key}) : super(key: key);

  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: bottomNavigationKey,
          index: _page,
          height: 75.0,
          items: const [
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.account_circle_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.amber,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _page == 0
            ? const HomeScreen()
            : _page == 1
                ? const ComponentList()
                : _page == 2
                    ? const HomeConfigurator()
                    : _page == 3
                        ? const Dashboard()
                        : null);
  }
}
