import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/groups/addpeople.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/groups/adduserstogroups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPeopleGroup extends StatelessWidget {
  const AddPeopleGroup({super.key});

  @override
  Widget build(BuildContext context) {
    AddPeopleGroupsController controller = Get.put(AddPeopleGroupsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          onPressed: () {
            controller.getBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<AddPeopleGroupsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: controller.usersModel.length,
                separatorBuilder: (context, index) => Divider(
                  thickness: 0.5,
                  color: Colors.grey.shade800,
                  height: 0.5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      /*   for (i; i < controller.responseBody.length; i++) {
                            if (i == index) {
                              print("i ===================================== $i");
                              print(
                                  "index ===================================== $index");
                              /*   Get.defaultDialog(
                                  title: "alert",
                                  middleText: "this user already in this group"); */
                            }
                          } */
                      if (controller.i <= index) {
                        /*   Get.defaultDialog(
                                      title: "....",
                                      middleText: "????????????????????????"); */
                        controller.addUserGroup(
                          controller.groupModel!.groupId!,
                          controller.myServices.sharedPref.getString("id")!,
                          controller.usersModel[index].usersId.toString(),
                        );
                      }
                      print("============================================ ");
                      print(
                          "i ===================================== ${controller.i}");
                      print(
                          "index ===================================== $index");
                      controller.update();
                    },
                    /* onLongPress: () {
                          Get.defaultDialog(
                              title: "Message",
                              middleText: "Are you Sure to Delete .",
                              buttonColor: AppColor.secondColor,
                              textConfirm: "Confirm",
                              textCancel: "Cancel",
                              confirmTextColor: AppColor.backGround,
                              onConfirm: () {
                                controller.removeUser(
                                    controller.usersModel[index].usersId.toString());
                              },
                              onCancel: () {
                                Get.offNamed(AppRotes.addPeopleGroup);
                              });
                        }, */
                    child: ShowAllUserToAddGroups(
                      backgroundImage: CachedNetworkImageProvider(
                        "${AppLink.imageUsers}/${controller.usersModel[index].usersImage}",
                      ),
                      txt: "${controller.usersModel[index].usersName}",
                      booll: controller.usersModel[index].select,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //  if (controller.responseBody.isNotEmpty)
                          ...List.generate(
                            controller.responseBody.length,
                            (i) => controller.responseBody[i]['reciever']
                                        .toString() ==
                                    controller.usersModel[index].usersId
                                ? IconButton(
                                    onPressed: () {
                                      controller.removeUser(
                                          controller.responseBody[i]['reciever']
                                              .toString(),
                                          controller.responseBody[i]['group_id']
                                              .toString());
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline_outlined,
                                    ),
                                  )
                                : Container(),
                          ),
                          /*    ...List.generate(
                                  controller.responseBodyTwo.length,
                                  (ind) => ind == index
                                      ? IconButton(
                                          onPressed: () {
                                            print(
                                                "one === ${controller.usersModel[index].usersId}");
                        
                                            print(
                                                "index of i ============================ $ind");
                                            print(
                                                "index of index ============================ $index");
                                          },
                                          icon: const Icon(
                                              Icons.add_circle_outline_outlined))
                                      : Container(),
                                ), */
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
                    print(
                        "index of user ======================== ${controller.usersModel[index].usersId}");
                    print(
                        "one from ui ========================== ${controller.responseBody[index]['reciever']}");
                    if (controller.usersModel[index].select == true) {
                      controller.group.remove(controller.usersModel[index]);
                      controller.usersModel[index].select = false;
                    } else {
                      controller.group.add(controller.usersModel[index]);
                      controller.usersModel[index].select = true;
                    }
                    controller.update(); */
