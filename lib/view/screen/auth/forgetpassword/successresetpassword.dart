import 'package:chat_app/controller/auth/successresetpassword_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        title: Text(
          "34".tr,
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .headline1!
              .copyWith(color: AppColor.grey),
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
            Text(
              "38".tr,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "33".tr,
                color: AppColor.blueDark,
                onBressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            /*  const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
