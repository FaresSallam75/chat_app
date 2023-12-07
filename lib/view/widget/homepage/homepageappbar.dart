import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;
  final IconData iconData;
  final bool activeColor;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.iconData,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: activeColor == true
                ? Colors.white // blue.shade900
                : Colors.grey.shade700,
          ),
          Text(
            textButton,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: activeColor == true ? Colors.white : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
