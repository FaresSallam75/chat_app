import 'package:chat_app/controller/auth/successsignup_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.blueDark,
            ),
            controller.checkIndex == "one"
                ? Text(
                    "52".tr,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline5,
                  )
                : Text(
                    "30".tr,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline5,
                  ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                textColor: AppColor.backGround,
                color: AppColor.blueDark,
                onPressed: () {
                  controller.goToPageLogin();
                },
                child: Text(
                  "Go To Login",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            /* const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
