import 'package:chat_app/controller/story/otherstorydetails_controller.dart';
import 'package:chat_app/view/widget/status/storydetails/show_otherstory_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowOtherStoryDetails extends StatelessWidget {
  const ShowOtherStoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
   Get.put(OtherStoryDetailsControllerImp());
    return const Scaffold(
      body: ShowOtherStoryDetailss(),
    );
  }
}
