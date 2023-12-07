import 'package:chat_app/controller/camera/cameradetails_controller.dart';
import 'package:chat_app/controller/groups/groupchat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoGroupChat extends StatelessWidget {
  const VideoGroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraInitialDetailsController());
    GroupChatController con = Get.find();

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
        builder: (controller) => SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
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
                child: Container(
                  color: Colors.black45,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: TextFormField(
                    controller: controller.caption,
                    maxLines: 5,
                    minLines: 1,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Add Caption",
                        hintStyle:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                        suffixIcon: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue.shade900,
                          child: GestureDetector(
                            //  onLongPress: onLongPress,
                            //  onLongPressUp: onLongPressUp,
                            onTap: () {
                              con.sendGroupMessage();
                              // Get.offNamed(AppRotes.groupChatPage);
                              Get.back();
                              Get.back();
                            },
                            child: const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        ),
                        border: InputBorder.none),
                  ),
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
