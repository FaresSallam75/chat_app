import 'package:chat_app/core/functions/fcmc.config.dart';
import 'package:chat_app/core/themes.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class PublicPermissions extends GetxController {
  
  late Locale language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  request() async {
    bool permissionStatus = await Permission.camera.request().isGranted;
    print("============================ $permissionStatus");

    // ignore: unrelated_type_equality_checks
    if (permissionStatus == Permission.camera.isDenied) {
      Get.snackbar("تنبيه", "الرجاء تشغيل الكاميرا");
    }
  }

  requestCamera() async {
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await Permission.camera.request().isGranted;
    if (!serviceEnabled) {
      Get.snackbar("تنبيه", "الرجاء تشغيل الكاميرا");
    }
    permission = await Permission.camera.request();
    if (permission == PermissionStatus.denied) {
      permission = await Permission.camera.request();
      Get.snackbar("تنبيه", "الرجاء تشغيل الكاميرا");
      if (permission == PermissionStatus.granted) {
        print("Camera ok =========================================");
      }
    }
    if (permission == PermissionStatus.permanentlyDenied) {
      Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق بدون استخدام الكاميرا");
      print("Not ok =========================================");
      // openAppSettings();
    } 
    requestMicrophone();

  }

  requestMicrophone() async {
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await Permission.microphone.request().isGranted;
    if (!serviceEnabled) {
      Get.snackbar("تنبيه", "الرجاء تشغيل الميكروفون");
    }
    permission = await Permission.camera.request();
    if (permission == PermissionStatus.denied) {
      permission = await Permission.camera.request();
      Get.snackbar("تنبيه", "الرجاء تشغيل الميكروفون");
      if (permission == PermissionStatus.granted) {
        print("Microphone ok =========================================");
      }
    }
    if (permission == PermissionStatus.permanentlyDenied) {
      Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق بدون استخدام الميكروفون");
      print("Not ok =========================================");
      // openAppSettings();
    }
      }

  /*  requestMicrophonePermission() async {
    PermissionStatus permissionStatus;
    permissionStatus = await Permission.microphone.status;
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await Permission.microphone.request();
      if (permissionStatus == PermissionStatus.denied) {
        if (permissionStatus == null) {
          print("null =============");
        }
        Get.snackbar("تنبيه", "الرجاء تشغيل الميكروفون");
      }
    }

    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      Get.snackbar(
          "تنبيه", " لا يمكن استعمال التطبيق بدون استخدام الميكروفون ");
    }
  } */

  /* requestCameraPermission() async {
    PermissionStatus permissionStatus;
    permissionStatus = await Permission.camera.status;
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await Permission.camera.request();
      if (permissionStatus == PermissionStatus.denied) {
        // ignore: unnecessary_null_comparison
        if (permissionStatus == null) {
          print("null =============");
        }
        Get.snackbar("تنبيه", "الرجاء تشغيل الكاميرا");
      }
    }
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      Get.snackbar("تنبيه", " لا يمكن استعمال التطبيق بدون استخدام الكاميرا ");
      openAppSettings();
    }
  } */
  /* intial() async {
    requestCamera();
    await Future.delayed(const Duration(seconds: 5));
    requestMicrophone();
  } */

  @override
  void onInit() {  
     requestPermissionNotifications();
    fcmsConfigration();
   // requestPermissionNotifications();
   // fcmsConfigration();
    //intial();
    //requestCameraPermission();
    //requestMicrophonePermission();
     requestCamera();
    //requestMicrophone();
    //request();
    String? shredPrefLang = myServices.sharedPref.getString("lang");
    if (shredPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (shredPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
