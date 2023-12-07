import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';

import 'package:chat_app/view/widget/messages/get_users.dart/getusersmessages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomListSearchUsers extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final TextEditingController? myController;
  final String txtSearch;
  final void Function()? onTap;
  const CustomListSearchUsers(
      {super.key,
      required this.onChanged,
      required this.onPressed,
      required this.myController,
      required this.txtSearch,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            children: [
              Container(
                height: 33,
                width: MediaQuery.of(context).size.width - 70,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: myController,
                  //onChanged: onChanged,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey.shade800,
                            size: 20,
                          ),
                        ),
                        /*   Text(
                          txtSearch,
                          style: const TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            color: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ) */
                      ],
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        textBaseline: TextBaseline.alphabetic),
                    contentPadding: const EdgeInsets.all(10),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue.shade900),
                ),
              )
            ],
          ),
        ),

        /*  Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            "Chats",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ), */
        GetBuilder<AllUserControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.usersMessagesModel.length,
              itemBuilder: (context, index) {
                var storyTime;

                int timeDifference = DateTime.now()
                    .difference(
                        DateTime.parse(controller.dataUsers[index].maximum!))
                    .inHours;
                print("timeDifference timeDifference $timeDifference");

                if (timeDifference >= 1) {
                  storyTime = "$timeDifference hours ago";
                  print("stotyTime1 $storyTime");
                  if (timeDifference >= 24) {
                    storyTime = "Yesterday";
                    if (timeDifference >= 48) {
                      storyTime = Jiffy(controller.dataUsers[index].maximum)
                          .format('dd/MM/yyyy');
                      print(
                          "i am Here ===================== $storyTime ====================");
                    }
                  }
                } else {
                  storyTime = DateTime.now()
                      .difference(
                          DateTime.parse(controller.dataUsers[index].maximum!))
                      .inMinutes;
                  print("stotyTime2 $storyTime");
                  if (storyTime >= 1) {
                    storyTime = "$storyTime minutes ago";
                    print("stotyTime3 $storyTime");
                  } else {
                    storyTime = "Just now";
                    print("stotyTime4 $storyTime");
                  }
                }

                return InkWell(
                  onTap: () {
                    controller.goToPageChatUsers(
                        controller.usersMessagesModel[index]);
                  },
                  child: GetUsersMessages(
                    backgroundImage: NetworkImage(
                        "${AppLink.imageUsers}/${controller.usersMessagesModel[index].usersImage}"),
                    txt: "${controller.usersMessagesModel[index].usersName}",
                    booll: false,
                    messageTime: timeDifference >= 24 && timeDifference <= 48
                        ? storyTime.toString()
                        : timeDifference >= 48
                            ? storyTime.toString()
                            : Jiffy(controller
                                    .usersMessagesModel[index].maximum)
                                .format('h:mm a'),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
