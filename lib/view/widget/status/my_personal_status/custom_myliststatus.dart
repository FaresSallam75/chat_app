import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/statuscircule.dart';
import 'package:chat_app/data/model/storiesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CustomMyListStatus extends GetView<StoryControllerImp> {
  final StoriesModel storiesModel;
  final void Function()? onTap;
  const CustomMyListStatus(
      {super.key, required this.storiesModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var storyTime;
    int timeDifference =
        DateTime.now().difference(DateTime.parse(storiesModel.date!)).inHours;
    print("timeDifference timeDifference $timeDifference");

    if (timeDifference >= 1) {
      storyTime = "$timeDifference hours ago";
      print("stotyTime1 $storyTime");
    } else {
      storyTime = DateTime.now()
          .difference(DateTime.parse(storiesModel.date!))
          .inMinutes;
      print("stotyTime2 $storyTime");
      if (storyTime >= 1) {
        storyTime = "$storyTime minutes ago";
        print("stotyTime3 $storyTime");
      } else {
        storyTime = "Just now";
        print("stotyTime4 $storyTime");
      }
    }

    return Column(
      children: [
        // ignore: unrelated_type_equality_checks
        /* if (storiesModel.hours == "1")
          controller.deleteStoryAutomatically(
              storiesModel.storyId!, storiesModel.file), */
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: InkWell(
              onTap: () {
                print(
                    "hours ======================================= ${storiesModel.hours}");
                controller.goToMyStoryDetails(storiesModel);
              },
              child: Row(
                children: [
                  storiesModel.file!.isImageFileName
                      ? CustomPaint(
                          painter: StatusPainter(true, 5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "${AppLink.imageStory}/${storiesModel.file}"),
                            radius: 30,
                            /* child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: "${AppLink.imageStory}/${storiesModel.file}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ), */
                          ),
                        )
                      : storiesModel.file!.isVideoFileName
                          ? CustomPaint(
                              painter: StatusPainter(true, 5),
                              child: CircleAvatar(
                                radius: 30,
                                //  backgroundColor: Colors.grey.shade900,
                                // foregroundColor: Colors.yellow,
                                child: VideoPlayer(
                                  // ignore: deprecated_member_use
                                  VideoPlayerController.network(
                                      "${AppLink.videoStory}/${storiesModel.file}"),
                                ),
                              ),
                            )
                          : CustomPaint(
                              painter: StatusPainter(true, 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade900,
                                radius: 30,
                                child: Center(
                                  child: Text(
                                    "${storiesModel.text}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "No View Yet",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        storyTime.toString(),
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    clipBehavior: Clip.antiAlias,
                    color: AppColor.greyDark.withOpacity(0.9),
                    elevation: 0.0,
                    enabled: true,
                    splashRadius: 2.0,
                    icon: const Icon(Icons.more_horiz_rounded),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return [
                        PopupMenuItem(
                          height: 50.0,
                          value: '/delete',
                          enabled: true,
                          textStyle: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .bodyText2!
                              .copyWith(
                                  color: AppColor.secondColor, fontSize: 18),
                          onTap: onTap,
                          child: const Text("Delete"),
                        ),
                        PopupMenuItem(
                          height: 50.0,
                          value: '/about',
                          textStyle: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .bodyText2!
                              .copyWith(
                                  color: AppColor.backGround, fontSize: 16),
                          child: Text("About"),
                        ),
                        PopupMenuItem(
                          height: 50.0,
                          value: '/forward',
                          textStyle: Theme.of(context)
                              .textTheme
                              // ignore: deprecated_member_use
                              .bodyText2!
                              .copyWith(
                                  color: AppColor.backGround, fontSize: 16),
                          child: Text("Forward"),
                        )
                      ];
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
