// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/status/desionstatuspage/card_status_design.dart';
import 'package:chat_app/view/widget/status/desionstatuspage/getallstatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentStatusPage extends GetView<StoryControllerImp> {
  const ContentStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoryControllerImp());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CardStatusDesign(
          title: "My Status",
          onPressAdd: () {
            controller.goToCamera();
          },
          onPressedIconCamera: () {
            controller.goToCamera();
          },
          onPressedIconText: () {
            controller.goToPageTextStatusScreen();
          },
        ),
        const SizedBox(height: 20),
        // Here Other Status  =============================================
        // Here Other Status  =============================================
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          child: const Text(
            "RECENT UPDATES",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        GetBuilder<StoryControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.otherStoriesModel.length,
              itemBuilder: (context, index) {
                /*   controller.responseData.forEach((key, value) {
                  print("its key ================================ $key");
                  print("its value ================================ $value");
                });
                print(
                    "one ============ ${controller.responseData.values.expand((element) => element).toList()[index]}"); */
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.grey.shade600, width: 0.4),
                    ),
                  ),
                  child: StatusImage(
                    otherStoriesModel: controller.otherStoriesModel[index]
                    /* OtherStoriesModel.fromJson(controller
                        .responseData.values
                        .expand((element) => element) 
                        .toList()[index] as Map<String, dynamic>) */
                    ,
                    // otherStoriesModel: controller.otherStoriesModel[index],
                  ),
                );

                //controller.userLists.values.expand((list) => list ).toList()[index]
              },
            ),
          ),
        )
      ],
    );
  }
}
