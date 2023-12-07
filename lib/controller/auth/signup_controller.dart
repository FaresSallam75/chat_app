import 'dart:io';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/file_upload.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/authdata/authdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SigupController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  File? file;
  bool? loading;
  bool isShowPassword = true;

  signUp();
  goToSigninPage();
}

class SigupControllerImp extends SigupController {
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  AuthData authData = AuthData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    loading = false;
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    super.dispose();
  }

  @override
  goToSigninPage() {
    Get.offNamed(AppRotes.login);
  }

  chooseImageOption() {
    showBottomSheetMenu(chooseImageGallery, chooseImageCamera);
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(AppRotes.selectImageUser);
    if (file == null) return;
    loading = true;
    update();
    await Future.delayed(const Duration(seconds: 4));
    loading = false;
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera(AppRotes.selectImageUser);
    if (file == null) return;
    print("file camera ================================ $file ");
    update();
  }

  @override
  signUp() async {
    //var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "username": username.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
      };
      var response = await authData.sendData(data, file);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          /*  // data.addAll(response['data']);
          Get.offNamed(AppRotes.login); */
          String usersid = response['data'].toString();
          FirebaseMessaging.instance.subscribeToTopic("users$usersid");
          Get.offNamed(AppRotes.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: "Phone Number OR Email IS Already Exist",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: "alert",
        middleText: "Not Valid Data",
      );
    }
  }

  goToPageContinue() {
    if (formState.currentState!.validate()) {
      Get.toNamed(AppRotes.selectImageUser);
    } else {
      Get.defaultDialog(
        title: "alert",
        middleText: "Not Valid Data",
      );
    }
  }
}
