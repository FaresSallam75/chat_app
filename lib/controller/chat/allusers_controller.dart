import 'package:chat_app/controller/chat/search_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/groups/groupdata.dart';
import 'package:chat_app/data/model/groupmodel.dart';
import 'package:chat_app/data/model/messagemodel.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/model/usersmessagesmodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUserControllerImp extends SearchMixUsersController {
  List<UsersModel> data = [];
  List<UsersMessagesModel> dataUsers = [];
  List group = [];
  List<MessageModel> messageModel = [];
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  GroupData groupData = GroupData(Get.find());
  late TextEditingController groupName;
  List<GroupModel> groupModel = [];
  int? getTotalCounts;

  @override
  void onInit() {
    super.onInit();
    getUsers();
    getUsersWithMessages();
    viewGroups();
    getTotalCountUsers();
    search = TextEditingController();
    searchUsers = TextEditingController();
    groupName = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
    searchUsers.dispose();
    groupName.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
  }

  getUsers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await messageData.getAllUsers((myServices.sharedPref.getString("id")!));
    print("=============================== Controller !!!!! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List responseBody = response['data'];
        data.addAll(responseBody.map((e) => UsersModel.fromJson(e)));
      } else {
        data.clear();
        //statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getUsersWithMessages() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await messageData
        .getUsersMesssages(myServices.sharedPref.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dataUsers.clear();
        List responseData = response['data'];
        dataUsers
            .addAll(responseData.map((e) => UsersMessagesModel.fromJson(e)));
      } else {
        dataUsers.clear();
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalCountUsers() async {
    var response = await messageData
        .getTotalCountUsers(myServices.sharedPref.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getTotalCounts = int.parse(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewGroups() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.viewGroups(
      myServices.sharedPref.getString("id")!,
      // myServices.sharedPref.getString("id")!,
    );
    print("=============================== Controller !! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        groupModel.clear();
        List responseBody = response['data'];
        groupModel.addAll(responseBody.map((e) => GroupModel.fromJson(e)));
      } else {
        groupModel.clear();
        //  statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  createGroups() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.addGroup(
      groupName.text.toString(),
      myServices.sharedPref.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAllChat(sender, reciever, file) async {
    if (file != null) {
      await messageData.deleteAllChat(sender, reciever, file);
    } else {
      messageData.deleteAllChat(sender, reciever, "");
    }
    getUsersWithMessages();
  }

  goToPageChat(UsersModel usersModel) {
    Get.toNamed(AppRotes.chatDetails, arguments: {"usermodel": usersModel});
  }

  goToPageChatUsers(UsersMessagesModel usersMessagesModel) {
    Get.toNamed(AppRotes.chatPageWithUsers,
        arguments: {"usersmessagesmodel": usersMessagesModel});
  }

  goToPageNewMemeber() {
    Get.toNamed(AppRotes.getNewChat);
  }

  goToCameraPage() {
    Get.toNamed(AppRotes.cameraPage);
  }

  /* goToGroupChatPage(GroupModel groupModel, UsersModel UsersModel) {
    Get.toNamed(AppRotes.groupChatPage, arguments: {"dataGroups": groupModel , "UsersModel" : UsersModel});
  } */
}
