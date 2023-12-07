import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/setting/setting_data.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  late StatusRequest statusRequest;
  List<UsersModel> userModel = [];
  SettingData settingData = SettingData(Get.find());
  MyServices myServices = Get.find();
  String? defaultImage;
  ScrollController? scrollController;

  @override
  void onInit() {
    getUsersSetting();
    scrollController = ScrollController();
    scrollController!.addListener(() {});

    super.onInit();
  }

  getUsersSetting() async {
    userModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await settingData
        .viewDataSetting((myServices.sharedPref.getString("id")!));
    print("=============================== Controller !! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseBody = response['data'];
        userModel.addAll(responseBody.map((e) => UsersModel.fromJson(e)));
        defaultImage = response['data'][0]['users_image'].toString();
        myServices.sharedPref.remove("image");
        myServices.sharedPref.setString("image", defaultImage!);

        print("defaultImage ============================== $defaultImage");
      }
    }
    update();
  }

  goToPageEditProfile(UsersModel usersModel) {
    Get.toNamed(AppRotes.editProfileSetting,
        arguments: {"usermodel": usersModel});
  }

  logout() {
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRotes.welocomeScreen);
    update();
  }
}
