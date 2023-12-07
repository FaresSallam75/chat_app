import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class RowAppBarChatDetails extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  final String txt;
  final void Function()? onPressedVideo;
  final void Function()? onPressedPhone;

  const RowAppBarChatDetails({
    super.key,
    required this.backgroundImage,
    required this.txt,
    required this.onPressedVideo,
    required this.onPressedPhone,
  });

  @override
  Widget build(BuildContext context) {
    // "${AppLink.imageChat}/${controller.usersModel.usersImage!}"
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          // child: image,
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
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 20,
                  color: AppColor.backGround,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Cairo"),
            ),
            Text(
              "tap here for contact info",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.backGround),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: onPressedVideo, icon: const Icon(Icons.video_call)),
        IconButton(onPressed: onPressedPhone, icon: const Icon(Icons.phone)),
      ],
    );
  }
}

/* 
Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: image,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          txt,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
      ],
    );
 */



/* 
ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: image,
        ),
        title: Text(
          txt,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "tap here for contact info",
          style: TextStyle(fontSize: 10),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                )),
          ],
        ));

 */