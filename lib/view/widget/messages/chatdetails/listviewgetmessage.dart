import 'package:chat_app/controller/chat/chatdetails_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/messages/chatdetails/mymessage.dart';
import 'package:chat_app/view/widget/messages/chatdetails/othermessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListViewGetMessage extends StatelessWidget {
  const ListViewGetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatDetailsControllerImp());

    return Expanded(
      child: GetBuilder<ChatDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            reverse: true,
            controller: controller.scrollController,
            itemCount: controller.messageModel.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (controller.myServices.sharedPref.getString("id").toString() ==
                  (controller.messageModel[index].sender).toString()) {
             
                return MyMessages(
                  messageModel: controller.messageModel[index],
                  ind: index,
                  onPressedFile: () {
                    controller.deleteMessage(
                        controller.messageModel[index].messageId!,
                        controller.messageModel[index].file!);
                  },
                );
              } else {
                return OtherMessages(
                    messageModel: controller.messageModel[index]);
              }
            },
          ),
        ),
      ),
    );
  }
}
