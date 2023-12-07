import 'package:chat_app/controller/setting/profile_setting_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/setting/setting_data.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EditProfileSettingController extends GetxController {
  late StatusRequest statusRequest;
  late UsersModel userModel;
  SettingData settingData = SettingData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  String? file;
  bool isTyping = false;
  Widget? body;
  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController();

  initial()  {
    userModel = Get.arguments['usermodel'];
    name = TextEditingController();
    name.text = userModel.usersName!;
    file =  userModel.usersImage!;
  }

  @override
  void onInit() {
    getUsersSetting();
    initial();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  changeVal() {
    isTyping = true;
    update();
  }

  change(PointerDownEvent val) {
    isTyping = false;
    update();
  }

  changeDataProfile() async {
    // if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    Map map = {
      "name": name.text,
      "oldimage": userModel.usersImage!,
      "id": myServices.sharedPref.getString("id")!,
    };
    var response = await settingData.editSettings(map);
    print("=============================== Controller Using Text $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //  ProfileSettingController con = Get.find();
        // con.getUsersSetting();
        //  Get.offNamed(AppRotes.editProfileSetting);
        getUsersSetting();
      }
      // }
      update();
    }
  } 

  getUsersSetting() async {
    // ProfileSettingController con = Get.find();
    //userModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await settingData
        .viewDataSetting((myServices.sharedPref.getString("id")!));
    print("=============================== Controller !! $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // List responseBody = response['data'];
        // con.userModel.addAll(responseBody.map((e) => UsersModel.fromJson(e)));
        update();
      }
    }
    update();
  }

/*   refreshPage() {
    statusRequest = StatusRequest.loading;
    getUsersSetting();
    update();
  } */

  goToBack() {
    Get.offNamed(AppRotes.homePageScreen);
    SettingController controller = Get.find();
    controller.getUsersSetting();
  }

  goToPageEditProfileDetails(UsersModel userModel) {
    Get.toNamed(AppRotes.editProfileDetails,
        arguments: {"usermodel": userModel});
  }

   onRefresh() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(milliseconds: 1000));
    // refreshPage();
    getUsersSetting();
    refreshController.refreshCompleted();
    statusRequest = StatusRequest.success;
    update();
  }

   onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
    update();
  }

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
  }
}
