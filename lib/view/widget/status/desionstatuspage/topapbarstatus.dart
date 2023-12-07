import 'package:flutter/material.dart';

class TopAppBarStatus extends StatelessWidget {
  final String text;
  const TopAppBarStatus({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          // margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: InkWell(
            onTap: () {},
            child: Text(
              text,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        )
      ],
    );
  }
}
