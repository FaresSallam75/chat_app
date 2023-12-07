import 'package:chat_app/controller/story/mystorydetails_controller.dart';
import 'package:chat_app/view/widget/status/storydetails/show_mystory_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMyStoryDetails extends StatelessWidget {
  const ShowMyStoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyStoryDetailsControllerImp());
    return const Scaffold(
      body: ShowMyStoryDetailss(),
    );
  }
}
