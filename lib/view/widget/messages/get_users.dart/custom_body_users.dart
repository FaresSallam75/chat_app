import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/messages/get_users.dart/getusersmessages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomBodyAllUsers extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final TextEditingController? myController;
  final String txtSearch;
  final void Function()? onPressedGroup;
  const CustomBodyAllUsers({
    super.key,
    required this.onChanged,
    required this.onPressed,
    required this.myController,
    required this.txtSearch,
    required this.onPressedGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Chats",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressedGroup,
                icon: const Icon(
                  Icons.groups_2_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 33,
                  width: MediaQuery.of(context).size.width - 50,
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: myController,
                    onChanged: onChanged,
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
                          Text(
                            txtSearch,
                            style: const TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                Icon(Icons.align_vertical_top_outlined,
                    color: AppColor.blueDark)
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 22,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_rounded,
                  color: AppColor.blueDark,
                ),
              ),
            ),
            title: Text(
              "Archived Chats",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline4,
            ),
            // ignore: deprecated_member_use
            trailing: Text("12", style: Theme.of(context).textTheme.headline4),
          ),
          ListTile(
            leading: Text(
              "Broadcast Lists",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: Text(
              "New Group",
              style:
              // ignore: deprecated_member_use
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
            ),
          ),
          GetBuilder<AllUserControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.dataUsers.length,
                itemBuilder: (context, index) {
                  // ignore: prefer_typing_uninitialized_variables
                  var storyTime;
                  int timeDifference = DateTime.now()
                      .difference(
                          DateTime.parse(controller.dataUsers[index].maximum!))
                      .inHours;
                  if (timeDifference >= 1) {
                    storyTime = "$timeDifference hours ago";
                    if (timeDifference >= 24) {
                      storyTime = "Yesterday";
                      if (timeDifference >= 48) {
                        storyTime = Jiffy(controller.dataUsers[index].maximum)
                            .format('dd/MM/yyyy');
                      }
                    }
                  } else {
                    storyTime = DateTime.now()
                        .difference(DateTime.parse(
                            controller.dataUsers[index].maximum!))
                        .inMinutes;
                    if (storyTime >= 1) {
                      storyTime = "$storyTime minutes ago";
                    } else {
                      storyTime = "Just now";
                    }
                  }

                  if (controller.myServices.sharedPref.getString("id")! ==
                      controller.dataUsers[index].usersId!)
                  // ignore: curly_braces_in_flow_control_structures
                  if (kDebugMode) {
                    print("success ========================== ");
                  }

                  // ignore: curly_braces_in_flow_control_structures
                  return InkWell(
                    onTap: () {
                      controller.goToPageChatUsers(controller.dataUsers[index]);
                    },
                    child: Slidable(
                      key: ValueKey(controller.dataUsers[index]),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              controller.deleteAllChat(
                                  controller.myServices.sharedPref
                                      .getString("id")!,
                                  controller.dataUsers[index].usersId!,
                                  "controller.messageModel[index].file");
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context) {},
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),
                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 2,
                            onPressed: (BuildContext context) {},
                            backgroundColor: const Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Archive',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              Get.back();
                            },
                            backgroundColor: const Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.close,
                            label: 'Close',
                          ),
                        ],
                      ),

                      child: GetUsersMessages(
                        backgroundImage: CachedNetworkImageProvider(controller
                                    .dataUsers[index].usersImage !=
                                ""
                            ? "${AppLink.imageUsers}/${controller.dataUsers[index].usersImage}"
                            : AppLink.defaultErrorImage),
                        txt: "${controller.dataUsers[index].usersName}",
                        iconData: controller.dataUsers[index].seen == "1"
                            ? Icons.done_all
                            : Icons.done_all,
                        activeColor: controller.dataUsers[index].seen == "1"
                            ? true
                            : false,
                        booll: false,
                        messsageTxt: controller.dataUsers[index].text != ""
                            ? controller.dataUsers[index].text
                            : controller.dataUsers[index].file!.endsWith("mp4")
                                ? "video"
                                : controller.dataUsers[index].file!
                                            .endsWith("mp3") ||
                                        controller.dataUsers[index].file!
                                            .endsWith("opus") ||
                                        controller.dataUsers[index].file!
                                            .endsWith("m4a")
                                    ? "audio"
                                    : controller.dataUsers[index].file!
                                                .endsWith("jpg") ||
                                            controller.dataUsers[index].file!
                                                .endsWith("png")
                                        ? "photo"
                                        : "pdf",
                        messageTime:
                            timeDifference >= 24 && timeDifference <= 48
                                ? storyTime.toString()
                                : timeDifference >= 48
                                    ? storyTime.toString()
                                    : Jiffy(controller.dataUsers[index].maximum)
                                        .format('h:mm a'),
                        checkBool: controller.dataUsers[index].seen == "0" &&
                                controller.dataUsers[index].counts != "0"
                            ? true
                            : false,
                        countText: controller.dataUsers[index].counts,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
