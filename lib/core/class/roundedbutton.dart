

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  var title;
  var colour;
  void Function()? onPressed;
  RoundedButton({this.title, this.colour, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
