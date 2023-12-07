import 'package:chat_app/controller/chat/viewvideochat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ViewVideoChatPage extends StatelessWidget {
  const ViewVideoChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewVideoChatController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("View Video"),
      ),
      body: GetBuilder<ViewVideoChatController>(
        builder: (controller) => SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: controller.videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController),
                      )
                    : Container(),
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
                      controller.videoPlayerController.value.isPlaying
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
