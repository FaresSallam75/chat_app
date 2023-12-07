import 'package:chat_app/controller/setting/edit_profile_detail_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditImagePofile extends StatelessWidget {
  const EditImagePofile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileSettingDetailsController());
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: GetBuilder<EditProfileSettingDetailsController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      "Move and Scale",
                      style:
                          TextStyle(fontSize: 16, color: AppColor.backGround),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              /*   if (controller.loading == true)
                const Center(
                  child: CircularProgressIndicator(color: AppColor.secondColor),
                ), */
              Stack(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Image.file(controller.file!, fit: BoxFit.fitWidth),
                  ),
                  if (controller.loading == true)
                    const Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      right: 0.3,
                      left: 0.3,
                      child: Center(
                        child: CircularProgressIndicator(
                            color: AppColor.secondColor),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: AppColor.backGround),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.changeImageProfile();
                      
                      },
                      child: const Text(
                        "Choose",
                        style: TextStyle(color: AppColor.backGround),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
