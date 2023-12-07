import 'package:chat_app/controller/camera/cameradetails_controller.dart';
import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:chat_app/view/widget/status/imagestory.dart/textformmessageforImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoChatPage extends StatelessWidget {
  const VideoChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraInitialDetailsController());
    ChatWithUsersController chatWithUsersController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Video Chat Page "),
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
        builder: (controller) => SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height - 150,
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
                  myController: controller.caption,
                  onTap: () {
                    chatWithUsersController.sendMessageData();
                    // Get.toNamed(AppRotes.chatPageWithUsers);
                    Get.back();
                    Get.back();
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
