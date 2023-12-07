import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/class/statuscircule.dart';
import 'package:chat_app/data/model/otherstoriesmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListSearchUser extends GetView<StoryControllerImp> {
  final List<OtherStoriesModel> otherStoriesModel;
  const ListSearchUser({super.key, required this.otherStoriesModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: otherStoriesModel.length,
      itemBuilder: (context, index) {
        print(
            "oooooooooooooooooooooooooooooooooooooooooooo $otherStoriesModel");
        var storyTime;
        int timeDifference = DateTime.now()
            .difference(DateTime.parse(otherStoriesModel[index].date!))
            .inHours;
        if (timeDifference >= 1) {
          storyTime = "$timeDifference hours ago";
        } else {
          storyTime = DateTime.now()
              .difference(DateTime.parse(otherStoriesModel[index].date!))
              .inMinutes;
          if (storyTime >= 1) {
            storyTime = "$storyTime minutes ago";
          } else {
            storyTime = "Just now";
          }
        }

        return InkWell(
          onTap: () {
            controller.goToOtherStoryDetails(otherStoriesModel[index]);
          },
          child: Container(
            //  margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomPaint(
                      painter: StatusPainter(true, 5),
                      child: controller.otherStoriesModel[index].file != ""
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  "${AppLink.imageStory}/${controller.otherStoriesModel[index].file}" !=
                                          ""
                                      ? NetworkImage(
                                          "${AppLink.imageStory}/${controller.otherStoriesModel[index].file}")
                                      : "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}" !=
                                              ""
                                          ? NetworkImage(
                                              "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}")
                                          : const NetworkImage(
                                              AppLink.defaultErrorImage,
                                            ),
                            )
                          : CustomPaint(
                              painter: StatusPainter(true, 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade900,
                                radius: 30,
                                child: Center(
                                  child: Text(
                                    "${controller.otherStoriesModel[index].text}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          otherStoriesModel[index].usersName!,
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(
                          storyTime,
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
