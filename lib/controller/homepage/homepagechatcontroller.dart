import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/view/screen/calls/call_page.dart';
import 'package:chat_app/view/screen/chat/getallusers.dart';
import 'package:chat_app/view/screen/community/communities.dart';
import 'package:chat_app/view/screen/settings/setting_page.dart';
import 'package:chat_app/view/screen/stories/statusscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageChatController extends GetxController {}

class HomePageChatControllerImp extends HomePageChatController {
  StatusRequest statusRequest = StatusRequest.none;

  int currentPage = 3;

  List iconDat = [
    (Icons.change_circle_outlined),
    (Icons.call),
    (Icons.groups_3_rounded),
    (Icons.chat_bubble_outline_outlined),
    (Icons.settings_outlined),
  ];

  List listPage = [
    const StatusScreen(),
    const CallPage(),
    const Communities(),
    const GetAllUsers(),
    const SettingPage(),
  ];

  List textButtonAppBar = ["Story", "Calls", "Community", "Chats", "Settings"];

  changePage(int index) {
    statusRequest = StatusRequest.loading;
    update();
    currentPage = index;
    update();
    statusRequest = StatusRequest.success;
  }
}
