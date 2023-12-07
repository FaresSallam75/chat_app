import 'dart:async';
import 'dart:io';
import 'package:chat_app/controller/setting/edit_profile_setting_controller.dart';
import 'package:chat_app/controller/setting/profile_setting_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/file_upload.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:chat_app/data/setting/setting_data.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:math';
import '../../core/functions/handligdata.dart';

class EditProfileSettingDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late UsersModel userModel;
  SettingData settingData = SettingData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  late TextEditingController name;
  bool loading = false;

  @override
  void onInit() {
    userModel = Get.arguments['usermodel'];
    // loading = false;
    super.onInit();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    super.dispose();
  }

  cameraImage() async {
    file = await imageUploadCamera(AppRotes.editImagePofile);

    update();
  }

  galleryImage() async {
    file = await fileUploadGallery(AppRotes.editImagePofile);
    update();
  }

  changeImageProfile() async {
    statusRequest = StatusRequest.loading;
    update();
    Map map = {
      "name": userModel.usersName!,
      "oldimage": userModel.usersImage!,
      "id": myServices.sharedPref.getString("id")!,
    };
    var response = await settingData.editSettings(map, file);
    print("=============================== Controller Using Text $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        loading = true;
        update();
        await Future.delayed(const Duration(seconds: 3));
        Get.delete<EditProfileSettingDetailsController>();
        Get.delete<EditProfileSettingController>();
        Get.offNamed(AppRotes.homePageScreen);
        SettingController con = Get.find();
        con.getUsersSetting();
       
        /* myServices.sharedPref.remove("newImage");
        myServices.sharedPref
            .setString("newImage", file!.path.split("/").last.toString());
        print(
            "my services ====================== ${myServices.sharedPref.getString("newImage")}"); */
      }
      loading = false;
      update();
    }
    update();
  }

  goToBack() {
    Get.toNamed(AppRotes.editProfileSetting);
  }

  generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  saveImage(String path) async {
    int randomNum = generateRandomNumber(100, 10000);
    var response = await Dio()
        .get(path, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: randomNum.toString(),
      // isReturnImagePathOfIOS: true,
    );
    print("result  ===========================   $result ");
    print("random  ===========================   $randomNum ");
    print("path    ===========================     $path ");
    Get.back();
    update();
  }
}
