import 'package:flutter/material.dart';

class CustomAppbarChatGroup extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  final String txt;
  final void Function()? onPressedVideo;
  final void Function()? onPressedPhone;
  final void Function()? onPressedAddPeople;

  const CustomAppbarChatGroup({
    super.key,
    required this.backgroundImage,
    required this.txt,
    required this.onPressedVideo,
    required this.onPressedPhone,
    required this.onPressedAddPeople,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: backgroundImage,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "tap here for contact info",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // const Spacer(),
        Expanded(
          child: IconButton(
              onPressed: onPressedVideo, icon: const Icon(Icons.video_call)),
        ),
        Expanded(
            child: IconButton(
                onPressed: onPressedPhone, icon: const Icon(Icons.phone))),
        Expanded(
          child: IconButton(
              onPressed: onPressedAddPeople,
              icon: const Icon(Icons.group_add_outlined)),
        ),
      ],
    );
  }
}
