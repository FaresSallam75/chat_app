import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CutstomBodyAuth extends StatelessWidget {
  final String text;
  const CutstomBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.grey),
      ),
    );
  }
}
