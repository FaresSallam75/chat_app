import 'package:chat_app/controller/groups/addpeople.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllUserToAddGroups extends GetView<AddPeopleGroupsController> {
  final ImageProvider<Object>? backgroundImage;
  final String txt;
  final bool booll;
  final Widget? trailing;

  const ShowAllUserToAddGroups({
    super.key,
    required this.backgroundImage,
    required this.txt,
    required this.booll,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 45,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: backgroundImage,
            ),
            booll
                ? Positioned(
                    bottom: 0.0,
                    right: 0.1,
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
      trailing: trailing
    );
  }
}
