import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/view/widget/status/imagestory.dart/custombodyimagestory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageStory extends StatelessWidget {
  const ImageStory({super.key});

  @override
  Widget build(BuildContext context) {
    StoryControllerImp controller = Get.put(StoryControllerImp());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.cameraControllerImp.galleryFile = null;
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.crop_rotate_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.title_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mode_edit_outline_rounded),
          ),
        ],
      ),
      body: CustomBodyImageStory(
        file: (controller.cameraControllerImp.fileImage ??
            controller.cameraControllerImp.galleryFile ??
            controller.cameraControllerImp.fileData!),
        myController: controller.catption,
        onTap: () {
          controller.sendStory();
        },
      ),
    );
  }
}
