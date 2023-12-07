// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/statuscircule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CardStatusDesign extends GetView<StoryControllerImp> {
  final Function()? onPressAdd;
  final String title;
  final void Function()? onPressedIconCamera;
  final void Function()? onPressedIconText;
  const CardStatusDesign({
    super.key,
    required this.onPressAdd,
    required this.title,
    required this.onPressedIconCamera,
    required this.onPressedIconText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: GetBuilder<StoryControllerImp>(
        builder: (controller) => Column(
          children: [
            if (controller.stories.isNotEmpty)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.myStory.length,
                itemBuilder: (context, index) {
                  // ignore: prefer_typing_uninitialized_variables
                  var storyTime;
                  int timeDifference = DateTime.now()
                      .difference(
                          DateTime.parse(controller.stories[index].date!))
                      .inHours;
                  if (timeDifference >= 1) {
                    storyTime = "$timeDifference hours ago";
                  } else {
                    storyTime = DateTime.now()
                        .difference(
                            DateTime.parse(controller.stories[index].date!))
                        .inMinutes;
                    if (storyTime >= 1) {
                      storyTime = "$storyTime minutes ago";
                    } else {
                      storyTime = "Just now";
                    }
                  }
                  return Row(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.goToPageMyPersonalStatusScreen();
                            },
                            child: CustomPaint(
                              painter: StatusPainter(true, 5),
                              child: controller
                                      .stories[index].file!.isImageFileName
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          "${AppLink.imageStory}/${controller.stories[index].file}" !=
                                                  ""
                                              ? NetworkImage(
                                                  "${AppLink.imageStory}/${controller.stories[index].file}")
                                              : "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}" !=
                                                      ""
                                                  ? NetworkImage(
                                                      "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}")
                                                  : const NetworkImage(
                                                      AppLink.defaultErrorImage,
                                                    ),
                                    )
                                  : controller
                                          .stories[index].file!.isVideoFileName
                                      ? CircleAvatar(
                                          radius: 30,
                                          // backgroundColor: Colors.grey.shade900,
                                          // foregroundColor: Colors.yellow,
                                          child: VideoPlayer(
                                            VideoPlayerController.network(
                                                "${AppLink.videoStory}/${controller.stories[index].file}"),
                                          ),
                                        )
                                      : CustomPaint(
                                          painter: StatusPainter(true, 5),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade900,
                                            radius: 30,
                                            child: Center(
                                              child: Text(
                                                "${controller.stories[index].text}",
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.1,
                            // ignore: unrelated_type_equality_checks
                            child:
                                "${AppLink.imageStory}/${controller.stories[index].file}" !=
                                        ""
                                    ? Container()
                                    : Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            shape: BoxShape.circle),
                                        child: InkWell(
                                          onTap: onPressAdd,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          controller.goToPageMyPersonalStatusScreen();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontSize: 17),
                            ),
                            Text(
                              storyTime,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: onPressedIconCamera,
                        icon: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.shade400,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: onPressedIconText,
                        icon: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.shade400,
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            if (controller.stories.isEmpty)
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius:
                            30, // "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}"
                        backgroundImage: CachedNetworkImageProvider(
                            // "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("NewImage") ?? "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image") ?? AppLink.defaultErrorImage}"}"
                            controller.myServices.sharedPref
                                        .getString("image") !=
                                    ""
                                ? "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}"
                                : AppLink.defaultErrorImage
                            /*  controller.myServices.sharedPref
                                          .getString("image") !=
                                    null
                                  ? "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}" */

                            ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.1,
                        // ignore: unrelated_type_equality_checks
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              shape: BoxShape.circle),
                          child: InkWell(
                            onTap: onPressAdd,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      controller.goToCamera();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 17,
                                  color: AppColor.greyDark.withOpacity(0.9)),
                        ),
                        Text(
                          "Add to my status",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 15,
                                  color: AppColor.greyDark.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onPressedIconCamera,
                    icon: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade400,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressedIconText,
                    icon: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade400,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
