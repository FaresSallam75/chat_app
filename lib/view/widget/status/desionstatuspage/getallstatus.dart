import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/class/statuscircule.dart';
import 'package:chat_app/data/model/otherstoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StatusImage extends GetView<StoryControllerImp> {
  final OtherStoriesModel otherStoriesModel;
  const StatusImage({super.key, required this.otherStoriesModel});

  @override
  Widget build(BuildContext context) {
    DateTime dt1 = (DateTime.now());
    DateTime dt2 = DateTime.parse(otherStoriesModel.date!);
    // ignore: unused_local_variable
    int diff = dt1.difference(dt2).inHours;

    // ignore: prefer_typing_uninitialized_variables
    var storyTime;
    int timeDifference = DateTime.now()
        .difference(DateTime.parse(otherStoriesModel.date!))
        .inHours;
    if (timeDifference >= 1) {
      storyTime = "$timeDifference hours ago";
    } else {
      storyTime = DateTime.now()
          .difference(DateTime.parse(otherStoriesModel.date!))
          .inMinutes;
      if (storyTime >= 1) {
        storyTime = "$storyTime minutes ago";
      } else {
        storyTime = "Just now";
      }
    }
    print("diff =========================================== $diff");
    print(
        "timeDifference =========================================== $timeDifference");

    return 
   /*  (otherStoriesModel.hours == "1")
        ? controller.deleteStoryAutomatically(
            otherStoriesModel.storyId!,
            otherStoriesModel.file,
          )
        :  */
        Column(
            children: [
              //if (controller.otherStoriesModel.isEmpty) const Column(children: []),
              InkWell(
                onTap: () {
                  controller.goToOtherStoryDetails(otherStoriesModel);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      otherStoriesModel.file!.isImageFileName
                          ? CustomPaint(
                              painter: StatusPainter(true, 5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${AppLink.imageStory}/${otherStoriesModel.file}"),
                                radius: 30,
                                /*   child: CachedNetworkImage(
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
                          : otherStoriesModel.file!.isVideoFileName
                              ? CustomPaint(
                                  painter: StatusPainter(true, 5),
                                  child: CircleAvatar(
                                    radius: 30,
                                    // backgroundColor: Colors.grey.shade900,
                                    // foregroundColor: Colors.yellow,
                                    child: VideoPlayer(
                                      // ignore: deprecated_member_use
                                      VideoPlayerController.network(
                                          "${AppLink.videoStory}/${otherStoriesModel.file}"),
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
                                        "${otherStoriesModel.text}",
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
                          Text(
                            otherStoriesModel.usersName!.toString(),
                            style: const TextStyle(
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
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
