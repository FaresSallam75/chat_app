import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/view/widget/status/my_personal_status/custom_myliststatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPersonalStatusScreen extends GetView<StoryControllerImp> {
  const MyPersonalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(top: 10, right: 15, left: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      //  Get.delete<StoryControllerImp>();
                      Get.offNamed(AppRotes.homePageScreen);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.blue.shade900,
                      size: 22,
                    ),
                  ),
                  // const SizedBox(width: 2),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRotes.homePageScreen);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  const Center(
                    child: Text("My Updates",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: "ans")),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
            
            GetBuilder<StoryControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Padding( 
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  child: ListView.separated(
                    reverse: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 3),
                    shrinkWrap: true,
                    itemCount: controller.stories.length,
                    itemBuilder: (context, index) => controller
                                .stories[index].userId! ==
                            controller.myServices.sharedPref.getString("id")!
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: Colors.grey.shade600, width: 0.4),
                              ),
                            ),
                            child: CustomMyListStatus(
                              storiesModel: controller.stories[index],
                              onTap: () {
                                controller.deleteStory(
                                    controller.stories[index].storyId!,
                                    controller.stories[index].file);
                              },
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
            if (controller.stories.isNotEmpty)
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Your status updates will disappear after 24 hours.",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
                ),
              )
          ],
        ),
      ),
    );
  }
}
