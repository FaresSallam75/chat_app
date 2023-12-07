
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/model/otherstoriesmodel.dart';
import 'package:chat_app/data/stories/story_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixController extends GetxController {

   StatusRequest statusRequest = StatusRequest.none;
    StoryData storyData = StoryData(Get.find());
  late TextEditingController search;
  bool isSearch = false;
  List<OtherStoriesModel> listData = [];

  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storyData.searchUserStory(search.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => OtherStoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearchItems(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchIcons() {
    isSearch = true;
    getSearchData();
    update();
  }

  showSnack() {
    if (search.text == "") {
      Get.snackbar(
        "alert",
        "Search Empty",
        backgroundColor: AppColor.black,
        colorText: AppColor.backGround,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
