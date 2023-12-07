import 'dart:io';

import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/authdata/authdata.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/model/usersmessagesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixUsersController extends GetxController {
  
  MessageData messageData = MessageData(Get.find());
  AuthData authData = AuthData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController search;
  late TextEditingController searchUsers;
  bool isSearch = false;
  bool isSearchUsers = false;
  List<UsersMessagesModel> usersMessagesModel = [];
  List<UsersModel> usersModel = [];
  CameraControllerImp cameraControllerImp = Get.put(CameraControllerImp());

  getSearchMessageUsers() async {
    usersMessagesModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await messageData.search(search.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        usersMessagesModel
            .addAll(responseData.map((e) => UsersMessagesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getSearchAllUsers() async {
    usersModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await authData.search(searchUsers.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        usersModel.clear();
        List responseData = response['data'];
        usersModel.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearchUsers(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      if (Get.currentRoute == "/getnewchat" ||
          Get.previousRoute == "/getnewchat") {
        isSearchUsers = false;
      } else {
        isSearch = false;
      }
      update();
    }
  }

  onSearchIcons() {
    isSearchUsers = false;
    if (Get.currentRoute == "/getnewchat" ||
        Get.previousRoute == "/getnewchat") {
      isSearchUsers = true;
      getSearchAllUsers();
    } else {
      isSearch = true;
      getSearchMessageUsers();
    }
    update();
  }

  showSnack() {
    if (search.text == "" || searchUsers.text == "") {
      Get.snackbar(
        "alert",
        "Search Empty",
        backgroundColor: AppColor.black,
        colorText: AppColor.backGround,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  willPopScope() {
    Get.defaultDialog(
        title: "Warning",
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.secondColor),
        middleText: "Do You Want Exit From App",
        middleTextStyle:
            const TextStyle(fontSize: 17, color: AppColor.secondColor),
        backgroundColor: AppColor.backGround,
        buttonColor: AppColor.thirdColor,
        cancelTextColor: AppColor.secondColor,
        confirmTextColor: AppColor.secondColor,
        onConfirm: () {
          exit(0);
        },
        onCancel: () {
          Get.back();
        });
    return Future.value(false);
  }
}
