import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
 MyServices myServices = Get.find();
  @override
  int? get priority => 1;
  
  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRotes.homePageScreen);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRotes.login);
    }
    /* if (controller.shredPrefLang!.isNotEmpty ) {
      return const RouteSettings(name: AppRotes.homePage);
    } */

    return null;
  }
}
