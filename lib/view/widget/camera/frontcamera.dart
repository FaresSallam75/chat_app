import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFrontCamera extends StatelessWidget {
  const CustomFrontCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraControllerImp>(builder: (controller) => 
       Container(
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.shade900,
          child:  InkWell(
              onTap: () {
                controller.cameraFront();
              },
              child: Transform.rotate(
                angle: controller.transform,
                child: Transform.rotate(
                  angle: controller.transform,
                  child: const Icon(
                    Icons.flip_camera_ios_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          
        ),
      ),
    );
  }
}
