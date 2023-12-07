import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/view/widget/homepage/appbarchatdetails.dart';
import 'package:chat_app/view/widget/messages/chatdetails/customcard.dart';
import 'package:chat_app/view/widget/messages/chatdetails/listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ChatPageWithUsers extends StatelessWidget {
  const ChatPageWithUsers({super.key});

  @override
  Widget build(BuildContext context) {
    ChatWithUsersController controller = Get.put(ChatWithUsersController());
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
            //backgroundColor: AppColor.blueDark,
            leading: InkWell(
              onTap: () {
                controller.goToPageAllUsers();
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            title: RowAppBarChatDetails(
              backgroundImage: CachedNetworkImageProvider(
                controller.usersMessagesModel!.usersImage! == ""
                    ? AppLink.defaultErrorImage
                    : "${AppLink.imageUsers}/${controller.usersMessagesModel!.usersImage!}",
              ),
              txt: "${controller.usersMessagesModel!.usersName}",
              onPressedPhone: () {
               // controller.goToMakeAudioCall();
              },
              onPressedVideo: () {
                controller.goToMakeVideoCall();
              },
            ),
          ),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.reverse) {
                if (!controller.isVisible) {
                  controller.isVisible = true;
                  controller.update();
                }
              } else if (notification.direction == ScrollDirection.forward) {
                if (controller.isVisible) {
                  controller.isVisible = false;
                  controller.update();
                }
              }
              return true;
            },
            child: GetBuilder<ChatWithUsersController>(
              builder: (controller) => SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WillPopScope(
                  child: Stack(
                    children: [
                      const Column(
                        children: [ListViewChat(), CustomCard()],
                      ),
                      Positioned(
                        bottom: 120,
                        right: 10,
                        child: Visibility(
                          visible: controller.isVisible,
                          child: FloatingActionButton(
                            backgroundColor: Colors.blue.shade900,
                            onPressed: () {
                              controller.scrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                              controller.isVisible = false;
                              controller.update();
                            },
                            child: const Icon(Icons.arrow_downward_sharp),
                          ),
                        ),
                      )
                    ],
                  ),
                  onWillPop: () {
                    return controller.willPopScope();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
