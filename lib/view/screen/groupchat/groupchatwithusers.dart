import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/groups/groupchat_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/groups/customappbarchatgroup.dart';
import 'package:chat_app/view/widget/groups/customcardgroupchat.dart';
import 'package:chat_app/view/widget/groups/groupmymessage.dart';
import 'package:chat_app/view/widget/groups/groupothermesssage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GroupChatPageWithUsers extends StatelessWidget {
  const GroupChatPageWithUsers({super.key});

  @override
  Widget build(BuildContext context) {
    GroupChatController controller = Get.put(GroupChatController());

    return Stack(
      children: [
        Image.asset(
          "assets/images/background3.jpg",
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
                controller.getBack();
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            title: CustomAppbarChatGroup(
              backgroundImage: const CachedNetworkImageProvider(
                AppLink.defaultErrorImage,
              ),
              txt: controller.groupModell!.groupName!,
              onPressedPhone: () {
                controller.goToMakeAudioCall();
              },
              onPressedVideo: () {
                controller.goToMakeVideoCall();
              },
              onPressedAddPeople: () {
                controller.goToPageAddPeople(controller.groupModell);
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
            child: GetBuilder<GroupChatController>(
              builder: (controller) => SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WillPopScope(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: ListView.builder(
                                reverse: true,
                                controller: controller.scrollController,
                                itemCount:
                                    controller.viewGroupMessagesModel.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (controller.myServices.sharedPref
                                          .getString("id")!
                                          .toString() ==
                                      (controller
                                          .viewGroupMessagesModel[index].sender!
                                          .toString())) {
                                    // timetime = controller.messageModel[index].time!;
                                    return GroupMyMessageWithUsers(
                                      viewGroupMessagesModel: controller
                                          .viewGroupMessagesModel[index],
                                      onPressedFile: () {
                                        controller.deleteMessageGroup(
                                            controller
                                                .viewGroupMessagesModel[index]
                                                .messageId!,
                                            controller
                                                .viewGroupMessagesModel[index]
                                                .file!);
                                      },
                                    );
                                  } else {
                                    return GroupOtherMessageWithUsers(
                                        viewGroupMessagesModel: controller
                                            .viewGroupMessagesModel[index]);
                                  }
                                },
                              ),
                            ),
                          ),
                          const CustomCardGroupChat()
                        ],
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
