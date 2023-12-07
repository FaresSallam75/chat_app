import 'package:chat_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/widget/auth/custombodyauth.dart';
import 'package:chat_app/view/widget/auth/custombutton.dart';
import 'package:chat_app/view/widget/auth/customtexttitleaith.dart';
import 'package:chat_app/view/widget/auth/custtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordComtrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        title: Text(
          "44".tr,
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .headline1!
              .copyWith(color: AppColor.blueDark),
        ),
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColor.blueDark),
      ),
      body: GetBuilder<ResetPasswordComtrollerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextTitlleAuth(text: "37".tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CutstomBodyAuth(text: "36".tr),
                  const SizedBox(
                    height: 30,
                  ),
                  CustoemTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "23".tr);
                    },
                    labl: "23".tr,
                    hinText: "15".tr,
                    iconData: Icons.lock_outline,
                    myController: controller.password,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    obscuretext: controller.isShowPassword,
                  ),
                  CustoemTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "23".tr);
                    },
                    labl: "23".tr,
                    hinText: "45".tr,
                    iconData: Icons.lock_outline,
                    myController: controller.rePassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    obscuretext: controller.isShowPassword,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButtonAuth(
                    text: "35".tr,
                    color: AppColor.blueDark,
                    onBressed: () {
                      controller.resetPassword();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
