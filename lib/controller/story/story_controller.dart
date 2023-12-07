// ignore_for_file: invalid_use_of_protected_member
import 'dart:async';
import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/controller/story/search_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/model/otherstoriesmodel.dart';
import 'package:chat_app/data/model/storiesmodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class StoryControllerIm extends GetxController {
  sendStory();
  getStories();
  goToPageTextStatusScreen();
  goToBack();
  addStory();

  //goToOtherStoryDetails(OtherStoriesModel otherStoriesModel);
  //deleteStory(String id, String file);
}

class StoryControllerImp extends SearchMixController {
  MyServices myServices = Get.find();

  List<StoriesModel> stories = [];
  List<OtherStoriesModel> otherStoriesModel = [];

  Map myStory = {};
  Map otherStory = {};
  late TextEditingController text;
  late TextEditingController catption;
  CameraControllerImp cameraControllerImp = Get.find();
  bool sendButton = false;
  Widget? body;
  ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Timer? timer;
  MessageData messageData = MessageData(Get.find());
  int index = 0;

  List listColors = [
    AppColor.blueColor,
    AppColor.blueDark,
    AppColor.grey,
    AppColor.greyDark,
    AppColor.orange,
    AppColor.secondColor,
    AppColor.thirdColor,
    Colors.cyan,
    Colors.yellow,
  ];

  //Map<String, List<Map<String, dynamic>>> usersDataMap = {};
  Map<int, List> usersStatus = {};
  OtherStoriesModel? others;
  //Map<String, dynamic> responseData = {};
  List responseData = [];
  List users = [];

  @override
  void onInit() {
    super.onInit();
    text = TextEditingController();
    catption = TextEditingController();
    search = TextEditingController();
    getStories();
    getOtherStories();
    refreshStory();

    //refreshStory();
  }

  @override
  void dispose() {
    super.dispose();
    text.dispose();
    catption.dispose();
    search.dispose();
    formState.currentState!.dispose();
    timer!.cancel();
  }

  chageColor() {
    if (index == 8) return index = 0;
    listColors[index];
    index++;

    /*    if (listColors.length <= 7) {
      listColors[index];
      index++;
    } else {
      listColors[0];
    } */

    /*  for (int i = 0; i <= listColors.length - 1; i++) {
      check = listColors[i];
      print("list =============================== ${listColors[i]}");
      print("i =================================================== $i");
      index = i++;
    } */

    update();
  }

  refreshStory() {
    // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
    if (myServices.sharedPref == null || myServices.sharedPref == "") return;

    Timer.periodic(const Duration(minutes: 2), (timer) {
      getStories();
      getOtherStories();
    });
  }

  onChanged(String value) {
    if (value.isNotEmpty) {
      sendButton = true;
      update();
    } else {
      sendButton = false;
      text.clear();
      update();
    }
  }

  sendStory() async {
    statusRequest = StatusRequest.loading;
    update();
    Map dataMap = {
      "userid": myServices.sharedPref.getString("id")!,
      "text": text.text,
      "caption": catption.text,
    };
    var response = await storyData.sendDataData(
      dataMap,
      cameraControllerImp.fileImage ??
          cameraControllerImp.galleryFile ??
          cameraControllerImp.videoPath ??
          cameraControllerImp.fileData,
    );
    print("================= Controller Using Image $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getStories();
        cameraControllerImp.galleryFile = null;
        cameraControllerImp.fileImage = null;
        cameraControllerImp.videoPath = null;
        cameraControllerImp.fileData = null;
        text.clear();
        catption.clear();
        sendButton = false;
      }
    }
    Get.offNamed(AppRotes.homePageScreen);
    update();
  }

  getStories() async {
    stories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await storyData.viewStory(myServices.sharedPref.getString("id")!);
    print("=============================== Controller myStory  $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseBody = response['data'];
        stories.addAll(responseBody.map((e) => StoriesModel.fromJson(e)));
        myStory.addAll({myServices.sharedPref.getString("id"): responseBody});
      } else {
        //statusRequest = StatusRequest.loading;

        response['data'];
        //statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getOtherStories() async {
    otherStoriesModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await storyData.viewOtherStory(myServices.sharedPref.getString("id")!);
    print(
        "=============================== Controller  getOtherStories $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        responseData = response['data'];

        otherStoriesModel
            .addAll(responseData.map((e) => OtherStoriesModel.fromJson(e)));

        /* otherStoriesModel
            .addAll(responseData.map((e) => OtherStoriesModel.fromJson(e)));
 */
        // others = OtherStoriesModel.fromJson(responseData);

        //data = OtherStoriesModel.fromJson(response['data']);

        //others = OtherStoriesModel.fromJson(responseData);
        /* responseData.forEach((key, value) {
          print("keys ================================= ============ $key");
          print("value ========================================== $value");
          for (var item in value) {
            if (item is Map<String, dynamic>) {
              // Assuming OtherStoriesModel has a fromJson constructor method
              OtherStoriesModel model = OtherStoriesModel.fromJson(item);
              otherStoriesModel.add(model);
            }
          }
        }); */

        /*   for (var entry in response['data']) {
          int userId = entry['user_id'];
          // If the user_id doesn't exist in the map, create an empty list
          usersStatus[userId] ??= [];
          // Add text or file entry to the list corresponding to the user_id
          String text = entry['text'];
          String file = entry['file'];
          // Choose between text or file based on availability
          String status = text.isNotEmpty ? text : file;
          usersStatus[userId]!.add(status);
          print("status:  ===================================== $status");
          print("userId:  ===================================== $userId");
        }
        // Display the usersStatus content
        usersStatus.forEach((userId, userStatus) {
          print("User ID:======================== $userId");
          print("Statuses:================================ $userStatus");
      
        });
        print("usersStatus ============================= $usersStatus");
        print(
            "otherStoriesModel ============================= $otherStoriesModel");
        print(
            "users ===================================================== $users"); */
      } else {
        response['data'];
        // statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteStory(String id, [String? file]) {
    storyData.deleteStoryData(id, file);
    stories.removeWhere((element) {
      return element.storyId == id;
    });
    if (stories.isEmpty) {
      Get.offNamed(AppRotes.homePageScreen);
    } else {
      getStories();
    }

    // Schedule the deletion after one hour
    /*  Timer(const Duration(hours: 1), () {
      // Check i the story with the given ID still exists
      if (stories.any((element) => element.storyId == id)) {
        storyData.deleteStoryData(id, file);
        stories.removeWhere((element) => element.storyId == id);
      }
    }); */
  }

  deleteStoryAutomatically(String storyId, [String? file]) {
    storyData.deleteStoryAutomatically(storyId, file);
    otherStoriesModel.removeWhere((element) {
      return element.storyId == storyId;
    });
  }

  /*  deleteStoryAutomatically(String storyId, [String? file]) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storyData.deleteStoryAutomatically(storyId, file);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getStories();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  } */

  goToPageTextStatusScreen() {
    Get.toNamed(AppRotes.textStatusScreen);
  }

  goToPageMyPersonalStatusScreen() {
    Get.toNamed(AppRotes.myPersonalStatusScreen);
  }

  goToBack() {
    Get.offNamed(AppRotes.homePageScreen);
  }

  goToOtherStoryDetails(OtherStoriesModel otherStoriesModel) {
    Get.toNamed(AppRotes.showOtherStoryDetails,
        arguments: {"otherStoriesModel": otherStoriesModel});
  }

  goToMyStoryDetails(StoriesModel storiesModel) {
    Get.toNamed(AppRotes.showMyStoryDetails,
        arguments: {"storiesmodel": storiesModel});
  }

  goToCamera() {
    Get.toNamed(AppRotes.cameraPage);
  }

  void onRefresh() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      await Future.delayed(const Duration(milliseconds: 1000));
      // refreshPage();
      getStories();
      refreshController.refreshCompleted();
      statusRequest = StatusRequest.success;
      update();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
    update();
  }

/* 
  Widget custom(Widget widget) {
    return CustomFooter(
      builder: (context, mode) {
        update();
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const Text("pull up load");
          print("one ==================  $body");
        } else if (mode == LoadStatus.loading) {
          body = const CircularProgressIndicator();
          print("two ==================  $body");
        } else if (mode == LoadStatus.failed) {
          body = const Text("Load Failed!Click retry!");
          print("three ==================  $body");
        } else if (mode == LoadStatus.canLoading) {
          body = const Text("release to load more");
          print("four ==================  $body");
        } else {
          body = const Text("No more Data");
          print("five ==================  $body");
        }
        print("final 1 ==========================  $body");
        print("final 2 ==========================  $widget");
        update();
        return body;
      },
    );
  } */
}


   /*  // dealing with data if data is Map
        (response['data'] as Map<String, dynamic>).forEach((key, value) {
          usersDataMap[key] = List<Map<String, dynamic>>.from(value);
        });
        // Display the usersDataMap content
        usersDataMap.forEach((userId, userData) {
          print("User ID: ================================== $userId ");
          print("Data: ======================================== $userData");
          getData = userData;
        }); */