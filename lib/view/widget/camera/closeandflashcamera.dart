import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCloseAndFlashCamera extends StatelessWidget {
  const CustomCloseAndFlashCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 25,
            ),
          ),
          const Spacer(),
          GetBuilder<CameraControllerImp>(
            builder: (controllerImp) => InkWell(
              onTap: () {
                controllerImp.flashWorking();
              },
              child: controllerImp.flash
                  ? const Icon(Icons.flash_on_outlined)
                  : const Icon(Icons.flash_off_outlined,
                      color: Colors.white, size: 25),
            ),
          )
        ],
      ),
    );
  }
}
