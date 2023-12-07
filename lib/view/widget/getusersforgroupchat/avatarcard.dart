import 'package:flutter/material.dart';

class AvatarCardUsers extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final String txt;
  const AvatarCardUsers(
      {super.key, required this.backgroundImage, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundImage: backgroundImage,
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text(
            txt,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
