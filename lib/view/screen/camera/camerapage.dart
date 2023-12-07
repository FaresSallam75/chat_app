import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/view/widget/camera/closeandflashcamera.dart';
import 'package:chat_app/view/widget/camera/frontcamera.dart';
import 'package:chat_app/view/widget/camera/futurebuildercamera.dart';
import 'package:chat_app/view/widget/camera/galleryfromcamera.dart';
import 'package:chat_app/view/widget/camera/takephotoorvideo.dart';
import 'package:chat_app/view/widget/camera/textcamera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraControllerImp());

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<CameraControllerImp>(
        builder: (controller) => SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Stack(
                children: [
                  CustomFutureBuilder(
                    future: controller.cameraValue,
                    controller: controller.cameraController,
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomGalleryFromCamera(onTap: () {
                                if (Get.currentRoute == "/chatpagewithusers" ||
                                    Get.previousRoute == "/chatpagewithusers") {
                                  controller
                                      .goToGallery(AppRotes.sendImageChatUsers);
                                } else if (Get.currentRoute == "/camerapage" ||
                                    Get.previousRoute == "/homepagescreen") {
                                  controller.goToGallery(AppRotes.imageStory);
                                } else if (Get.currentRoute ==
                                        "/groupChatPage" ||
                                    Get.previousRoute == "/groupChatPage") {
                                  controller
                                      .goToGallery(AppRotes.groupCameraPage);
                                } else if (Get.previousRoute ==
                                        "/chatdetails" ||
                                    Get.currentRoute == "/camerapage") {
                                  controller
                                      .goToGallery(AppRotes.sendImageChat);
                                }
                              }),
                              const CustomTakePhotoOrVideo(),
                              const CustomFrontCamera(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomCloseAndFlashCamera(),
                ],
              ),
              const CustomTextCamera()
            ],
          ),
        ),
      ),
    );
  }
}
