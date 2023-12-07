import 'package:flutter/material.dart';

class ShowAllUser extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final String txt;
  final bool booll;

  const ShowAllUser({
    super.key,
    required this.backgroundImage,
    required this.txt,
    required this.booll,
  });
  // Jiffy(controller.chat.currentTime).format(" h:mm: a")

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
              color: Colors.black, width: 0.2, style: BorderStyle.solid),
        ),
      ),
      child: ListTile(
        // trailing: Text("10 PM"),
        leading: Container(
          height: 55,
          width: 50,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundImage: backgroundImage,
              ),
              booll
                  ? Positioned(
                      bottom: 2,
                      right: 1,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.teal.shade900,
                        child: const Icon(
                          Icons.check,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        title: Text(
          txt,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
