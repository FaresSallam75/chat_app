import 'package:chat_app/controller/groups/groupchat_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/groups/groupdata.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPeopleGroupsController extends GetxController {
  List<UsersModel> usersModel = [];
  List group = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  MessageData messageData = MessageData(Get.find());
  GroupData groupData = GroupData(Get.find());
  // ignore: prefer_typing_uninitialized_variables
  var groupModel;
  List responseBody = [];
  List responseBodyTwo = [];
  int i = 0;

  @override
  void onInit() {
    super.onInit();
    groupModel = Get.arguments['groupModell'] ?? Get.arguments['groupModelTwo'];
    //getUsers();
    getUsers();
    viewUserGroup();
  }

  viewUserGroup() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.viewGroupReciever(groupModel!.groupId!);
    print("=============================== response users $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        responseBody = response['data'];
      } else {
        responseBody.clear();
      }
    }
    update();
  }

  getUsers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await messageData.getAllUsers((myServices.sharedPref.getString("id")!));
    print("=============================== Controller !! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        usersModel.clear();
        responseBodyTwo = response['data'];
        usersModel.addAll(responseBodyTwo.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addUserGroup(String groupId, String sender, String reciever) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.addRecieverGroup(groupId, sender, reciever);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewUserGroup();
        getUsers();
        Get.rawSnackbar(
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          title: "Message",
          messageText: const Text(
            "user was added to this group",
            style: TextStyle(color: AppColor.backGround),
          ),
        );
      } else {
        Get.defaultDialog(
            title: "alert",
            middleText: "this user already exist in this group");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  removeUser(String reciever, String groupId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.removeRecieverGroup(
        myServices.sharedPref.getString("id")!, reciever, groupId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getUsers();
        viewUserGroup();
        Get.rawSnackbar(
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
          title: "Message",
          messageText: const Text(
            "this user was deleted from this group",
            style: TextStyle(color: AppColor.backGround),
          ),
        );
      } else {
        Get.defaultDialog(
            title: "Message", middleText: "only usercreate can remove users");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getBack() {
    try {
      Get.back();
      GroupChatController con = Get.find();
      con.viewUserGroup();
    } catch (e) {
      print("Exception ================================== $e");
    }
  }
}
