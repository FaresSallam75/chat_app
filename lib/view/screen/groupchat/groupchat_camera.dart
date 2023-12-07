import 'package:chat_app/controller/groups/groupchat_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupCameraPage extends StatelessWidget {
  const GroupCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupChatController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.black,
        actions: [
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.text_fields_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 180,
              width: MediaQuery.of(context).size.width,
              child: controller.cameraControllerImp.fileData != null
                  ? Container(color: AppColor.black)
                  : Image.file(
                      controller.cameraControllerImp.fileImage ??
                          controller.cameraControllerImp.galleryFile!,
                      fit: BoxFit.fill,
                    ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GetBuilder<GroupChatController>(
                  builder: (controller) => TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption ..",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined,
                            color: Colors.white),
                      ),
                      suffixIcon: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            controller.sendGroupMessage();
                            Get.back();
                            Get.back();
                            //  controller.makeAnimation();
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
