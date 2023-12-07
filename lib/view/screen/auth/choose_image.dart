import 'package:chat_app/controller/auth/signup_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectImageUser extends StatelessWidget {
  const SelectImageUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigupControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Image",
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        // centerTitle: true,
      ),
      body: GetBuilder<SigupControllerImp>(
        builder: (controller) => ListView(
          children: [
            /*  IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blueAccent,
              ),
            ), */
            const SizedBox(height: 100),
            Center(
              child: Text(
                "Select Image to your Profile (it's optional)",
                style: Theme.of(context)
                    .textTheme
                    // ignore: deprecated_member_use
                    .headline1!
                    .copyWith(color: AppColor.blueDark, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                backgroundImage: controller.file != null
                    ? FileImage(controller.file!)
                    : null,
                radius: 150,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: 33,
                      right: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.blueDark,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.chooseImageOption();
                          },
                          child: controller.file != null
                              ? Container()
                              : const Icon(
                                  Icons.add,
                                  color: AppColor.backGround,
                                ),
                        ),
                      ),
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Material(
                color: AppColor.blueDark,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                elevation: 5.0,
                child: CustomButtonAuth(
                  text: "Sign Up",
                  color: AppColor.blueDark,
                  onBressed: () {
                    controller.signUp();
                    // Get.offNamed(AppRotes.login);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
