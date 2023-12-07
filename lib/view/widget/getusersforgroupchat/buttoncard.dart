import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final IconData icon;
  final String txt;
  const ButtonCard({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColor.blueDark,
        radius: 25,
        child: Icon(
          icon,
          color: AppColor.backGround,
        ),
      ),
      title: Text(txt),
    );
  }
}
