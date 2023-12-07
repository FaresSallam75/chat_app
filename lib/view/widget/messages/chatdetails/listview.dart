import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/messages/chatdetails/my_messages_with_users.dart';
import 'package:chat_app/view/widget/messages/chatdetails/other_messages_with_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListViewChat extends StatelessWidget {
  const ListViewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ChatWithUsersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            reverse: true,
            controller: controller.scrollController,
            itemCount: controller.messageModel.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              controller.indexUser = index;
              print(
                  "controller.indexUser ============================= ${controller.indexUser}");
              print("index ============================= $index");
              if (controller.myServices.sharedPref
                      .getString("id")!
                      .toString() ==
                  (controller.messageModel[index].sender!.toString())) {
                // timetime = controller.messageModel[index].time!;
                return MyMessageWithUsers(
                  ind: index,
                  messageModel: controller.messageModel[index],
                  onPressedFile: () {
                    controller.deleteMessage(
                        controller.messageModel[index].messageId!,
                        controller.messageModel[index].file!);
                  },
                );
              } else {
                return OtherMessageWithUsers( 
                    messageModel: controller.messageModel[index]);
              }
            },
          ),
        ),
      ),
    );
  }
}
