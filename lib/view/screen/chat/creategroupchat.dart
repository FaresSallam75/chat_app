import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/publiccustomtextformfield.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/widget/getusersforgroupchat/avatarcard.dart';
import 'package:chat_app/view/widget/messages/get_users.dart/showallusers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateGroupChat extends GetView<AllUserControllerImp> {
  const CreateGroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    //final AllUserControllerImp controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 105,
                  // margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Get.offNamed(AppRotes.getNewChat);
                              // Get.back();
                            },
                            child: Text("Cancel",
                                style: Theme.of(context)
                                    .textTheme
                                    // ignore: deprecated_member_use
                                    .headline4!),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Text(
                                  "Add Paricipants",
                                  style: Theme.of(context)
                                      .textTheme
                                      // ignore: deprecated_member_use
                                      .headline1!,
                                ),
                                Text(
                                  "0/${controller.getTotalCounts}",
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              customTextFormFieldCreateGroup(
                                  controller.formState,
                                  (value) {
                                    return validInput(value!, 1, 20, "name");
                                  },
                                  controller.groupName,
                                  () {
                                    controller.createGroups();
                                  },
                                  () {
                                    Get.back();
                                    controller.groupName.clear();
                                  });
                              /* Get.defaultDialog(
                                title: "Enter Group Name",
                                content: TextFormField(
                                    controller: groupsController.groupName,
                                    decoration: InputDecoration(
                                      hintText: "Enter Group Name",
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 13,
                                          textBaseline:
                                              TextBaseline.alphabetic),
                                      contentPadding: const EdgeInsets.all(10),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: AppColor.blueDark),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: AppColor.blueDark),
                                      ),
                                      filled: true,
                                    )),
                                confirm: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: AppColor.blueDark),
                                  ),
                                  textColor: Colors.white,
                                  color: AppColor.blueDark,
                                  onPressed: () {
                                    controller.createGroups();
                                  },
                                  child: const Text("Create"),
                                ),
                                cancel: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          color: AppColor.blueDark)),
                                  textColor: Colors.white,
                                  color: AppColor.blueDark,
                                  onPressed: () {
                                    Get.back();
                                    controller.groupName.clear();
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ); */
                            },
                            child: Text(
                              "Next",
                              style: Theme.of(context)
                                  .textTheme
                                  // ignore: deprecated_member_use
                                  .headline4!,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 32,
                        width: MediaQuery.of(context).size.width - 10,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: controller.search,
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
            // Divider(thickness: 1, color: Colors.grey.shade800),
            GetBuilder<AllUserControllerImp>(
              builder: (controller) => controller.group.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.data.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                    height:
                                        controller.group.length > 0 ? 90 : 10);
                              }
                              if (controller.data[index - 1].select == true) {
                                return InkWell(
                                  onTap: () {
                                    controller.group
                                        .remove(controller.data[index - 1]);
                                    controller.data[index - 1].select = false;
                                    controller.update();
                                  },
                                  child: AvatarCardUsers(
                                      backgroundImage: NetworkImage(
                                          "${AppLink.imageUsers}/${controller.data[index - 1].usersImage}"),
                                      txt:
                                          "${controller.data[index - 1].usersName}"),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        //  Divider(thickness: 3, color: Colors.grey.shade800)
                      ],
                    )
                  : Container(),
            ),
            GetBuilder<AllUserControllerImp>(
              builder: (controller) => Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.data.length,
                  /*  separatorBuilder: (context, index) => Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade800,
                    height: 0.5,
                  ), */
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (controller.data[index].select == true) {
                          controller.group.remove(controller.data[index]);
                          controller.data[index].select = false;
                        } else {
                          controller.group.add(controller.data[index]);
                          controller.data[index].select = true;
                        }
                        controller.update();
                      },
                      child: ShowAllUser(
                        backgroundImage: CachedNetworkImageProvider(
                            "${AppLink.imageUsers}/${controller.data[index].usersImage}"),
                        txt: "${controller.data[index].usersName}",
                        booll: controller.data[index].select,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
