import 'package:flutter/material.dart';

class CustomTextCamera extends StatelessWidget {
  const CustomTextCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Center(
        child:  Text(
          "Hold for video, tap for photo",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
