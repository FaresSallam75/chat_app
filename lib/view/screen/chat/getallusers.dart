import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/controller/groups/groupscontroller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/constant/customslidablewidget.dart';
import 'package:chat_app/core/functions/showbottomsheet.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/screen/chat/customlistsearchusers.dart';
import 'package:chat_app/view/widget/groups/publicgetgroups.dart';
import 'package:chat_app/view/widget/messages/get_users.dart/custom_appbar.dart';
import 'package:chat_app/view/widget/messages/get_users.dart/custom_body_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class GetAllUsers extends StatelessWidget {
  const GetAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllUserControllerImp());
    GroupsController groupsController = Get.put(GroupsController());

    return SafeArea(
      child: GetBuilder<AllUserControllerImp>(
        builder: (controller) => WillPopScope(
          child: Column(
            children: [
              controller.isSearch
                  ? Container()
                  : CustomAppbarUsers(onPressedCamera: () {
                      controller.goToCameraPage();
                    }, onPressedNewMember: () {
                      controller.goToPageNewMemeber();
                    }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider(color: Colors.black, thickness: 0.1),
              ),
              !controller.isSearch
                  ? CustomBodyAllUsers(
                      myController: controller.search,
                      onChanged: (val) {
                        controller.checkSearchUsers(val);
                      },
                      onPressed: () {
                        if (controller.search.text != "") {
                          controller.onSearchIcons();
                        } else {
                          controller.showSnack();
                        }
                      },
                      txtSearch: controller.search.text,
                      onPressedGroup: () {
                        showBottomSheetDesign(
                          context,
                          GetBuilder<GroupsController>(
                            builder: (controller) => ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.groupModelTwo.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  controller.goToGroupChatPageTwo(
                                      controller.groupModelTwo[index]);
                                },
                                child: customSlidableWidget(
                                  ValueKey(controller.groupModelTwo[index]),
                                  (value) {
                                    controller.deleteGroup(controller
                                        .groupModelTwo[index].groupId!);
                                  },
                                  (value) {},
                                  (value) {},
                                  (value) {
                                    Get.back();
                                  },
                                  HandlingDataView(
                                    statusRequest: controller.statusRequest,
                                    widget: PublicGetGroups(
                                        backgroundImage: const NetworkImage(
                                            AppLink.defaultErrorImage),
                                        txt:
                                            "${controller.groupModelTwo[index].groupName}",
                                        booll: false,
                                        trailing: Jiffy(controller
                                                .groupModelTwo[index].maximum)
                                            .format('dd/MM/yyyy h:mm a')),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          groupsController.groupName,
                          () {
                            groupsController.createGroups();
                          },
                          () {
                            Get.toNamed(AppRotes.getAllGroups);
                          }, // For onPressedAddPeople
                          controller.formState,
                          (val) {
                            return validInput(val!, 1, 20, "name");
                          },
                        );
                      },
                    )
                  : CustomListSearchUsers(
                      onTap: () {
                        Get.offAllNamed(AppRotes.homePageScreen);
                      },
                      myController: controller.search,
                      onChanged: (val) {
                        controller.checkSearchUsers(val);
                      },
                      onPressed: () {
                        if (controller.search.text != "") {
                          controller.onSearchIcons();
                        } else {
                          controller.showSnack();
                        }
                      },
                      txtSearch: controller.search.text,
                    ),
            ],
          ),
          onWillPop: () {
            return controller.willPopScope();
          },
        ),
      ),
    );
  }
}
