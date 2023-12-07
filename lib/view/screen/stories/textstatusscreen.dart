import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/view/widget/status/textstatus/content_body_textstatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStatusScreen extends StatelessWidget {
  const TextStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor:
            controller.listColors[controller.index], // Colors.indigo.shade600,
        body: const SafeArea(child: ContentBodyTextStatus()),
      ),
    );
  }
}
