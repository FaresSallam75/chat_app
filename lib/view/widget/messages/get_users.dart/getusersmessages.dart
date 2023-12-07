import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetUsersMessages extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  final String txt;
  IconData? iconData;
  bool? activeColor;
  String? messsageTxt;
  final bool booll;
  final String messageTime;
  String? countText;
  bool? checkBool;

  GetUsersMessages({
    super.key,
    required this.backgroundImage,
    required this.txt,
    this.iconData,
    this.activeColor,
    this.messsageTxt,
    required this.booll,
    required this.messageTime,
    this.countText,
    this.checkBool,
  });
  // Jiffy(controller.chat.currentTime).format(" h:mm: a")

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
              color: Colors.black, width: 0.2, style: BorderStyle.solid),
        ),
      ),
      child: ListTile(
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ignore: deprecated_member_use
            Text(messageTime, style: Theme.of(context).textTheme.headline3),
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 12,
              backgroundColor:
                  checkBool == true ? AppColor.blueDark : AppColor.backGround,
              child: Text(checkBool == true ? countText! : ""),
            )
          ],
        ),
        leading: SizedBox(
          height: 55,
          width: 50,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 30,
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
        title: Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 20,
                    color: activeColor == true
                        ? AppColor.blueDark
                        : AppColor.greyDark,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    messsageTxt!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
