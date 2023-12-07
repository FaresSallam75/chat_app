import 'package:chat_app/controller/homepage/homepagechatcontroller.dart';
import 'package:chat_app/view/widget/homepage/homepageappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHomePage extends StatelessWidget {
  const CustomButtonAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageChatControllerImp>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            //topLeft: Radius.circular(25),
            //topRight: Radius.circular(25),
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            height: 50,
            elevation: 0.0,
            shape: const CircularNotchedRectangle(),
            color: Colors.blueGrey.shade900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  controller.listPage.length,
                  (index) => Expanded(
                    child: CustomButtonAppBar(
                      textButton: controller.textButtonAppBar[index],
                      iconData: controller.iconDat[index],
                      onPressed: () {
                        controller.changePage(index);
                      },
                      activeColor:
                          controller.currentPage == index ? true : false,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
