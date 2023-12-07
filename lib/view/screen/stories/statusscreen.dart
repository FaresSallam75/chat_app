import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/view/screen/stories/list_search_user_stories.dart';
import 'package:chat_app/view/widget/status/content_statuspage.dart';
import 'package:chat_app/view/widget/status/desionstatuspage/textandsearch_status.dart';
import 'package:chat_app/view/widget/status/desionstatuspage/topapbarstatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoryControllerImp());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<StoryControllerImp>(
          builder: (controller) => Column(
            children: [
              const TopAppBarStatus(text: "Privacy"),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    TextAndSearchStatus(
                      text: "Status",
                      hintText: "Search",
                      myController: controller.search,
                      onChanged: (val) {
                        controller.checkSearchItems(val);
                      },
                      onPressedSearch: () {
                        if (controller.search.text != "") {
                          controller.onSearchIcons();
                        } else {
                          controller.showSnack();
                        }
                      },
                    ),
                  
                    const SizedBox(height: 20),
                    !controller.isSearch
                        ? const ContentStatusPage()
                        : ListSearchUser(
                            otherStoriesModel: controller.otherStoriesModel,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
