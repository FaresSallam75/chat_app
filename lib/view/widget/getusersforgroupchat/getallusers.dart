import 'package:flutter/material.dart';

class GetUsers extends StatelessWidget {
  final void Function()? onTap;
  final Image image;
  final String txt;
  const GetUsers(
      {super.key, required this.onTap, required this.image, required this.txt});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(radius: 25, child: image),
            const SizedBox(
              width: 5,
            ),
            Text(
              txt,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
