// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class AvatarContainer extends StatelessWidget {
  AvatarContainer({Key? key, required this.avatarUrl}) : super(key: key);

  final String avatarUrl;

  var token;

  getToken() async {
    final LocalStorage localStorage = LocalStorage('my_app');
    token = localStorage.getItem('token');
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          MaterialButton(
            child: Image.network(avatarUrl),
            onPressed: () {
              Get.toNamed('/settings');
            })
        ],
      ),
    );
  }
}
