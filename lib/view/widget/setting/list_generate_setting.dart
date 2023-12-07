import 'package:flutter/material.dart';

class ListGenerateSettings extends StatelessWidget {
  final int count;
  final String textOne;
  final Widget icon;
  final Color color;
  const ListGenerateSettings({
    super.key,
    required this.count,
    required this.textOne,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          count,
          (index) => Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: color,
                          ),
                          child: icon

                          /* const Icon(
                          Icons.star_purple500_outlined,
                          color: Colors.white,
                        ), */

                          ),
                      const SizedBox(width: 20),
                      Text(textOne, // "Starred Messages",
                          style: Theme.of(context)
                              .textTheme
                              .headline3 //const TextStyle(fontSize: 15),
                          ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      ),
                    ],
                  ),
                ),
                /* Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.greenAccent.shade400,
                        ),
                        child: const Icon(
                          Icons.laptop,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        textTwo, //"Linked Devices",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      ),
                    ],
                  ),
                ), */
              ],
            ),
          ),
        ),
      ],
    );
  }
}
