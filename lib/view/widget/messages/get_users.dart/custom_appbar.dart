import 'package:flutter/material.dart';

class CustomAppbarUsers extends StatelessWidget {
  final void Function()? onPressedCamera;
  final void Function()? onPressedNewMember;
  const CustomAppbarUsers(
      {super.key,
      required this.onPressedCamera,
      required this.onPressedNewMember});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Text("Edit",
                style: Theme.of(context)
                    .textTheme
                    // ignore: deprecated_member_use
                    .headline4),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressedCamera,
          // controller.goToCameraPage();

          icon: Icon(
            Icons.camera_alt_outlined,
            color: Colors.blue.shade900,
          ),
        ),
        IconButton(
          onPressed: onPressedNewMember,
          // controller.goToPageNewMemeber();

          icon: Icon(Icons.edit_square, color: Colors.blue.shade900),
        ),
      ],
    );
  }
}
