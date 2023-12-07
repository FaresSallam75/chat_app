import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/groups/groupscontroller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/constant/customslidablewidget.dart';
import 'package:chat_app/core/functions/publiccustomtextformfield.dart';
import 'package:chat_app/core/functions/validateinput.dart';
import 'package:chat_app/view/widget/groups/publicgetgroups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class GetAllGroups extends StatelessWidget {
  const GetAllGroups({super.key});

  @override
  Widget build(BuildContext context) {
    GroupsController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Groups", style: Theme.of(context).appBarTheme.titleTextStyle),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Get.offNamed(AppRotes.homePageScreen);
            Get.back();
            controller.viewGroupsMessage();
            controller.viewGroups();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: GetBuilder<GroupsController>(
        builder: (controller) => ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.blueDark,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        // controller.createGroups();
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
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: AppColor.backGround,
                      ),
                    ),
                  )
                ],
              ),
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.groupModel.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    controller.goToGroupChatPage(
                      controller.groupModel[index],
                    );
                  },
                  child: customSlidableWidget(
                    ValueKey(controller.groupModel[index].groupId!),
                    (value) {
                      controller
                          .deleteGroup(controller.groupModel[index].groupId!);
                    },
                    (value) {},
                    (value) {},
                    (value) {
                      Get.back();
                    },
                    PublicGetGroups(
                      backgroundImage:
                          const NetworkImage(AppLink.defaultErrorImage),
                      txt: "${controller.groupModel[index].groupName}",
                      booll: false,
                      trailing: Jiffy(controller.groupModel[index].dateCreate)
                          .format('dd/MM/yyyy h:mm a'),
                      // "${controller.groupModel[index].counts} Member",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
