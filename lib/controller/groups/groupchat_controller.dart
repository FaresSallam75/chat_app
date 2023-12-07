import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/controller/groups/audiogroupchat_controller.dart';
import 'package:chat_app/controller/groups/groupscontroller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/groups/groupdata.dart';
import 'package:chat_app/data/model/groupmodel.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/model/viewgroupmessagesmodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class GroupChatController extends AudioGroupChatController {
  List<UsersModel> usersModel = [];
  GroupData groupData = GroupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController groupName;
  late TextEditingController caption;
  late TextEditingController textMessage;
  List<ViewGroupMessagesModel> viewGroupMessagesModel = [];
  bool isVisible = false;
  bool isShow = false;
  late ScrollController scrollController;
  bool sendButton = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  List<GroupModel> groupModel = [];
  // ignore: prefer_typing_uninitialized_variables
  var groupModell;
  List responseBody = [];

  List listData = [
    "Camera",
    "Photo & Video Library",
    "Document",
    "Location",
    "Contact",
    "Poll"
  ];

  List iconData = [
    (Icons.camera_alt_outlined),
    (Icons.photo_size_select_actual_outlined),
    (Icons.document_scanner),
    (Icons.place_outlined),
    (Icons.contact_page_outlined),
    (Icons.poll_outlined),
  ];

  @override
  void onInit() {
    super.onInit();
    groupModell = Get.arguments['groupModel'] ?? Get.arguments['groupModelTwo'];
    groupName = TextEditingController();
    textMessage = TextEditingController();
    caption = TextEditingController();
    viewGroupsMessages();
    viewUserGroup();
    viewGroups();
    scrollController = ScrollController();
    scrollController.addListener(() {});
    initState();
    intialState();
    isRecording;
    requestPermissionNotifications();
    fcmsConfigration();
  }

  @override
  void dispose() {
    super.dispose();
    groupName.dispose();
    textMessage.dispose();
    caption.dispose();
    textMessage.clear();
    focusNode.dispose();
    scrollController.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    audioPlayer.dispose();
    audioPlayer.stop();
  }

  performFunction(int index) {
    if (index == 0) {
      Get.toNamed(AppRotes.cameraPage);
    }
    if (index == 1) {
      cameraControllerImp.goToGallery(AppRotes.groupCameraPage);
    }
    if (index == 2) {
      cameraControllerImp.goToFiles(AppRotes.groupCameraPage);
    }
  }

  onChanged(String value) {
    if (value.isNotEmpty) {
      sendButton = true;
    } else {
      sendButton = false;
    }
    update();
  }

  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShow = false;
        update();
      }
    });
    scrollController = ScrollController();
  }

  showImoji() {
    isShow = !isShow;
    sendButton = true;
    focusNode.unfocus();
    focusNode.canRequestFocus = true;
    update();
  }

  makeAnimation() {
    if (sendButton) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
    }
  }

  viewUserGroup() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.viewGroupReciever(groupModell!.groupId!);
    if (kDebugMode) {
      print("=============================== response users $response");
    }
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

  viewGroupsMessages() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await groupData.viewGroupMessages(groupModell!.groupId!);
    if (kDebugMode) {
      print("=============================== Controller !! $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewGroupMessagesModel.clear();
        List responseBody = response['data'];
        viewGroupMessagesModel.addAll(
            responseBody.map((e) => ViewGroupMessagesModel.fromJson(e)));
      } else {
        viewGroupMessagesModel.clear();
        //statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  sendGroupMessage() async {
    try {
      //statusRequest = StatusRequest.loading;
      // update();
      Map dataGroup = {
        "groupId": groupModell!.groupId!,
        "sender": myServices.sharedPref.getString("id")!,
        "text": textMessage.text,
      };

      var response = await groupData.sendMessage(
        dataGroup,
        cameraControllerImp.fileImage ??
            cameraControllerImp.galleryFile ??
            cameraControllerImp.videoPath ??
            cameraControllerImp.fileData ??
            audioPath,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // makeAnimation();
          //viewGroupsMessages();
          textMessage.clear();
          cameraControllerImp.fileImage = null;
          cameraControllerImp.galleryFile = null;
          cameraControllerImp.videoPath = null;
          cameraControllerImp.fileData = null;
          audioPath = null;
          sendButton = false;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } catch (e) {
      print("exception ============================================= $e");
    }
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
        //statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteMessageGroup(messId, file) async {
    if (file != null) {
      await groupData.deleteMessageGroup(messId, file);
    } else {
      groupData.deleteMessageGroup(messId, "");
    }
    Get.back();
    viewGroupsMessages();
  }

  willPopScope() {
    if (isShow) {
      isShow = false;
    } else {
      Get.back();
    }
    update();
    return Future.value(false);
  }

  goToPageGroupChatDetails(ViewGroupMessagesModel viewGroupMessagesModel) {
    Get.toNamed(AppRotes.groupChatDetails,
        arguments: {"viewGroupMessagesModel": viewGroupMessagesModel});
  }

  goToPageAddPeople(var groupModel) {
    Get.toNamed(AppRotes.addPeopleGroup,
        arguments: {"groupModell": groupModell, "groupModelTwo": groupModel});
  }

  getBack() {
    try {
      //  Get.delete<GroupsController>();
      // Get.offNamed(AppRotes.homePageScreen);
      Get.back();
      GroupsController con = Get.find();
      con.viewGroups();
      con.viewGroupsMessage();
    } catch (e) {
      print("Exception ================================== $e");
    }
  }

  requestPermissionNotifications() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: false,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: false,
    );
  }

  fcmsConfigration() {
    FirebaseMessaging.onMessage.listen((message) {
      print("==================== Notifications  ================");
      print(message.notification!.title);
      print(message.notification!.body);
      FlutterRingtonePlayer.playNotification();

      if (myServices.sharedPref
          .getBool(myServices.sharedPref.getString("id")!)!) {
        audioPlayer.play(AssetSource("notify/send.mp3"));
      } else {
        audioPlayer.play(AssetSource("notify/notify.mp3"));
      }
      isPlay = true;
      refreshOrderNotification(message.data);
    });
  }

  refreshOrderNotification(data) {
    print("pade id ============================");
    data['pageid'];
    print("pade name ============================");
    data['pagename'];
    if (Get.currentRoute == "/groupChatPage" &&
        data['pagename'] == "refreshgroupmessage") {
      viewGroupsMessages();
    }
  }

  goToCameraPage() {
    Get.toNamed(AppRotes.cameraPage);
  }

  goToMakeAudioCall() {
    Get.toNamed(AppRotes.audioCall);
  }

  goToMakeVideoCall() {
    Get.toNamed(AppRotes.groupVideoCall);
  }
}
