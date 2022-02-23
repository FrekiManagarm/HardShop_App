import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  const AvatarContainer({
    Key? key,
    required this.avatarUrl
  }) : super(key: key);

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          MaterialButton(
            child: Image.network(avatarUrl),
            onPressed: () {

            }
          )
        ],
      ),
    );
  }
}
