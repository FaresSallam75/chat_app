import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTakePhotoOrVideo extends StatelessWidget {
  const CustomTakePhotoOrVideo({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // CameraControllerImp controller = Get.put(CameraControllerImp());

    return GetBuilder<CameraControllerImp>(
      builder: (controller) => GestureDetector(
        onLongPress: () {
          controller.startVideo();
        },
        onLongPressUp: () {
          if (Get.currentRoute == "/chatpagewithusers" ||
              Get.previousRoute == "/chatpagewithusers") {
            controller.stopVideo(AppRotes.videoChatPage);
          } else if (Get.currentRoute == "/homepagescreen" ||
              Get.previousRoute == "/homepagescreen") {
            controller.stopVideo(AppRotes.videoStory);
          } else if (Get.currentRoute == "/groupChatPage" ||
              Get.previousRoute       == "/groupChatPage") {
            controller.stopVideo(AppRotes.videoGroupChat);
          }
          // controller.stopVideo(AppRotes.videoChatPage);
        },
        onTap: () {
          if (!(controller.isRecording)) {
            if (Get.currentRoute == "/chatpagewithusers" ||
                Get.previousRoute == "/chatpagewithusers") {
              controller.takePhoto(AppRotes.cameraPage);
            } else if (Get.currentRoute == "/homepagescreen" ||
                Get.previousRoute == "/homepagescreen") {
              controller.takePhoto(AppRotes.cameraPage);
            } else if (Get.currentRoute == "/groupChatPage" ||
                Get.previousRoute == "/groupChatPage") {
              controller.takePhoto(AppRotes.cameraPage);
            }
            // controller.takePhoto(AppRotes.cameraPageChat);
          }
        },
        child: controller.isRecording
            ? const Icon(
                Icons.radio_button_on_outlined,
                color: Colors.red,
                size: 100,
              )
            : const Icon(
                Icons.radio_button_on_outlined,
                color: Colors.white,
                size: 80,
              ),
      ),
    );
  }
}
