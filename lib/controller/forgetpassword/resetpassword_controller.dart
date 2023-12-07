import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordComtroller extends GetxController {
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordComtrollerImp extends ResetPasswordComtroller {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    rePassword.dispose();
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRotes.successResetPassword);
  }

  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
        title: "Warning",
        middleText: "Password Not Match",
      );
    }

    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: "You Type the same previous password",
            titleStyle: const TextStyle(fontSize: 15, color: Colors.orange),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }
}
