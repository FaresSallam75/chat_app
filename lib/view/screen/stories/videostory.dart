import 'package:chat_app/controller/camera/cameradetails_controller.dart';
import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/view/widget/status/imagestory.dart/textformmessageforImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoStory extends StatelessWidget {
  const VideoStory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraInitialDetailsController());
    StoryControllerImp con = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: GetBuilder<CameraInitialDetailsController>(
        builder: (controller) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  child: controller.videoPlayerController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controller
                              .videoPlayerController!.value.aspectRatio,
                          child: VideoPlayer(controller.videoPlayerController!),
                        )
                      : Container()),
              Positioned(
                bottom: 0.0,
                child: TextFormForImage(
                  // formKey: controller.formState,
                  myController: con.catption,
                  onTap: () {
                    con.sendStory();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    controller.playVideo();
                  },
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black38,
                    child: Icon(
                      controller.videoPlayerController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
