import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/view/widget/getusersforgroupchat/buttoncard.dart';
import 'package:chat_app/view/widget/groups/publicgetgroups.dart';
import 'package:chat_app/view/widget/messages/get_users.dart/getusersmessages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetNewChat extends StatelessWidget {
  const GetNewChat({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => AllUserControllerImp());
    final AllUserControllerImp controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      ListTile(
                        title: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "New Chat",
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        trailing: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.shade300,
                          child: InkWell(
                            onTap: () {
                              if (Get.currentRoute == "/getnewchat" &&
                                  Get.previousRoute == "/creategroupchat") {
                                Get.offNamed(AppRotes.homePageScreen);
                                // Get.back();
                              } else {
                                Get.back();
                              }
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                        width: MediaQuery.of(context).size.width - 10,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: controller.searchUsers,
                          onChanged: (val) {
                            controller.checkSearchUsers(val);
                          },
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (controller.searchUsers.text != "") {
                                      controller.onSearchIcons();
                                    } else {
                                      controller.showSnack();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade800,
                                    size: 20,
                                  ),
                                ),
                                /*     const Text(
                                    "txtSearch",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Colors.black,
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
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 13,
                                textBaseline: TextBaseline.alphabetic),
                            contentPadding: const EdgeInsets.all(10),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GetBuilder<AllUserControllerImp>(
              builder: (controller) => Flexible(
                child: !controller.isSearchUsers
                    ? ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          if (!controller.isSearchUsers)
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRotes.createGroupChat);
                              },
                              child: const ButtonCard(
                                  icon: Icons.group, txt: "New Group"),
                            ),
                          if (!controller.isSearchUsers)
                            const ButtonCard(
                                icon: Icons.group_add, txt: "New Contact"),
                          if (!controller.isSearchUsers)
                            const ButtonCard(
                                icon: Icons.groups_sharp, txt: "New Community"),
                          const SizedBox(height: 5),
                          HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller
                                        .goToPageChat(controller.data[index]);
                                  },
                                  child: PublicGetGroups(
                                    backgroundImage: CachedNetworkImageProvider(
                                        "${AppLink.imageUsers}/${controller.data[index].usersImage}"),
                                    txt: "${controller.data[index].usersName}",
                                    booll: false,
                                    trailing: "",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: const SearchAllUsers(),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchAllUsers extends GetView<AllUserControllerImp> {
  const SearchAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return
        /*   Container(
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
                  controller: controller.search,
                  //onChanged: onChanged,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (controller.search.text != "") {
                              controller.onSearchIcons();
                            } else {
                              controller.showSnack();
                            }
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey.shade800,
                            size: 20,
                          ),
                        ),
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
                onTap: () {
                  Get.offAllNamed(AppRotes.homePageScreen);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue.shade900),
                ),
              )
            ],
          ),
        ), */
        ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.usersModel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageChat(controller.usersModel[index]);
          },
          child: GetUsersMessages(
              backgroundImage: NetworkImage(
                  "${AppLink.imageUsers}/${controller.usersModel[index].usersImage}"),
              txt: "${controller.usersModel[index].usersName}",
              booll: false,
              messageTime: ""),
        );
      },
    );
  }
}
