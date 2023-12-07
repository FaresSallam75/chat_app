import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/chatdetails_controller.dart';
import 'package:chat_app/view/widget/homepage/appbarchatdetails.dart';
import 'package:chat_app/view/widget/messages/chatdetails/cardcomponent.dart';
import 'package:chat_app/view/widget/messages/chatdetails/listviewgetmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ChatDetailsControllerImp controller = Get.put(ChatDetailsControllerImp());

    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            titleSpacing: 0.0,
            leading: InkWell(
              onTap: () {
                controller.goToHomePageScreen();
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: RowAppBarChatDetails(
              backgroundImage: NetworkImage(
                "${AppLink.imageUsers}/${controller.usersModel.usersImage!}",
              ),
              txt: "${controller.usersModel.usersName}",
              onPressedPhone: () {},
              onPressedVideo: () {},
            ),
          ),
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WillPopScope(
                  // ignore: prefer_const_constructors
                  child: Column(
                    children: const [
                      ListViewGetMessage(),
                      CustomCardComponent()
                    ],
                  ),
                  onWillPop: () {
                    return controller.willPopScope();
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
