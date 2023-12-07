import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/mystorydetails_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:story_view/story_view.dart';

class ShowMyStoryDetailss extends StatelessWidget {
  const ShowMyStoryDetailss({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyStoryDetailsControllerImp>(
      builder: (controller) => Stack(
        children: [
          PageView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.storyControllerImp.stories.length,
            itemBuilder: (context, index) => StoryView(
              storyItems: [
                controller.storiesModel!.file!.isImageFileName
                    ? StoryItem.pageImage(
                        url:
                            "${AppLink.imageStory}/${controller.storiesModel!.file!}",
                        controller: controller.storyController,
                        caption: controller.storiesModel!.caption,
                        shown: true,
                      )
                    : controller.storiesModel!.file!.isVideoFileName
                        ? StoryItem.pageVideo(
                            "${AppLink.videoStory}/${controller.storiesModel!.file!}",
                            controller: controller.storyController,
                            caption: controller.storiesModel!.caption,
                            shown: true,
                          )
                        : StoryItem.text(
                            title: "${controller.storiesModel!.text}",
                            backgroundColor: Colors.grey.shade900,
                            roundedTop: true,
                            roundedBottom: true,
                            shown: true,
                          )
              ],
              onComplete: () {
                Get.toNamed(AppRotes.myPersonalStatusScreen);
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: controller.storyController,
              inline: true,
              indicatorColor: Colors.white,
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Get.back();
                }
              },
            ),
          ),
          Positioned(
            top: 60.0,
            left: 15.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.backGround,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 23,
                  backgroundImage: CachedNetworkImageProvider(
                      "${AppLink.imageUsers}/${controller.storiesModel!.userimage!}"),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.storiesModel!.username}",
                      style: const TextStyle(color: AppColor.backGround),
                    ),
                    Text(
                      Jiffy(controller.storiesModel!.date).format('h:mm a'),
                      style: const TextStyle(color: AppColor.backGround),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
