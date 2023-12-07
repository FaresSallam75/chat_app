import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/groups/groupdata.dart';
import 'package:chat_app/data/model/groupmodel.dart';
import 'package:chat_app/data/model/groupmodeltwo.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupsController extends GetxController {
  GroupData groupData = GroupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<GroupModel> groupModel = [];
  List<GroupModelTwo> groupModelTwo = [];
  late TextEditingController groupName;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  //GroupModel? groupModel;
  List responseBody = [];
  CameraControllerImp cameraControllerImp = Get.find();

  @override
  void onInit() {
    super.onInit();
    groupName = TextEditingController();
    viewGroups();
    viewGroupsMessage();
    // viewUserGroup();
  }

  @override
  void dispose() {
    super.dispose();
    groupName.dispose();
    focusNode.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
  }

  // show only all groups
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
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // show only groups i chat with them
  viewGroupsMessage() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.viewGroupsChat(
      myServices.sharedPref.getString("id")!,
    );
    print("=============================== Controller !! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        groupModelTwo.clear();
        List responseBody = response['data'];
        groupModelTwo
            .addAll(responseBody.map((e) => GroupModelTwo.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
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
        viewGroups();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteGroup(String groupId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.deleteGroup(
        groupId, myServices.sharedPref.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewGroups();
      } else {
        Get.defaultDialog(
            title: "alert",
            middleText: "only usercreate can delete this group");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToGroupChatPage(GroupModel groupModel) {
    Get.toNamed(AppRotes.groupChatPage, arguments: {"groupModel": groupModel});
  }

  goToGroupChatPageTwo(GroupModelTwo groupModelTwo) {
    Get.toNamed(AppRotes.groupChatPage,
        arguments: {"groupModelTwo": groupModelTwo});
  }
}
