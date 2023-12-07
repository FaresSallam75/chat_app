import 'package:chat_app/controller/chat/chatdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendImageChat extends StatelessWidget {
  const SendImageChat({super.key});

  @override
  Widget build(BuildContext context) {
    ChatDetailsControllerImp controller = Get.put(ChatDetailsControllerImp());

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
              child: Image.file(
                // ignore: unnecessary_null_comparison
                /* (controller.cameraControllerImp.fileChat)! != null
                    ? (controller.cameraControllerImp.fileChat!)
                    : (controller.cameraControllerImp.imageFileChat!), */
                (controller.cameraControllerImp.fileImage == null
                    ? controller.cameraControllerImp.galleryFile!
                    : controller.cameraControllerImp.fileImage!),
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
                child: GetBuilder<ChatDetailsControllerImp>(
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
                            controller.sendMessage();
                            Get.back();
                            Get.back();
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
