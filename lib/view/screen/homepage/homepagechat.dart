import 'package:chat_app/controller/homepage/homepagechatcontroller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/homepage/button_appbar_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreeen extends StatelessWidget {
  const HomePageScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageChatControllerImp());
    return GetBuilder<HomePageChatControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          bottomNavigationBar: const CustomButtonAppBarHomePage(),
          body: controller.listPage.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
