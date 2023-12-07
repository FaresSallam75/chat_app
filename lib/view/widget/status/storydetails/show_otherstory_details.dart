import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/otherstorydetails_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:story_view/story_view.dart';

class ShowOtherStoryDetailss extends StatelessWidget {
  const ShowOtherStoryDetailss({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherStoryDetailsControllerImp>(
      builder: (controller) => Stack(
        children: [
          StoryView(
            storyItems: [
              ...List.generate(
                controller.storyControllerImp.otherStoriesModel.length,
                (index) => controller.storyControllerImp
                        .otherStoriesModel[index].file!.isImageFileName
                    ? StoryItem.pageImage(
                        url:
                            "${AppLink.imageStory}/${controller.storyControllerImp.otherStoriesModel[index].file!}",
                        controller: controller.storyController,
                        caption: controller.otherStoriesModel!.caption,
                        shown: true,
                      )
                    : controller.storyControllerImp.otherStoriesModel[index]
                            .file!.isVideoFileName
                        ? StoryItem.pageVideo(
                            "${AppLink.videoStory}/${controller.storyControllerImp.otherStoriesModel[index].file!}",
                            controller: controller.storyController,
                            caption: controller.otherStoriesModel!.caption,
                            shown: true,
                          )
                        : StoryItem.text(
                            title:
                                "${controller.storyControllerImp.otherStoriesModel[index].text}",
                            backgroundColor: Colors.grey.shade900,
                            roundedTop: true,
                            roundedBottom: true,
                            shown: true,
                          ),
              )
            ],
            onComplete: () {
              Get.back();
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
                      "${AppLink.imageUsers}/${controller.otherStoriesModel!.usersImage!}"),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.otherStoriesModel!.usersName}",
                      style: const TextStyle(color: AppColor.backGround),
                    ),
                    Text(
                      Jiffy(controller.otherStoriesModel!.date)
                          .format('h:mm a'),
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
