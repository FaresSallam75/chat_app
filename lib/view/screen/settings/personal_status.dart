import 'package:chat_app/controller/setting/psersonalstatus_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/setting/custombottommodalsheet.dart';
import 'package:chat_app/view/widget/setting/custombottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalStatus extends StatelessWidget {
  const PersonalStatus({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalStatusController controller = Get.put(PersonalStatusController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColor.blueDark,
          ),
        ),
        elevation: 0.0,
        title: Text(
          "About",
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              MaterialButton(
                onPressed: () {},
                child:
                    // ignore: deprecated_member_use
                    Text(
                  "Edit",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 17,
                        color: AppColor.blueDark,
                      ),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.blueDark,
          child: const Icon(Icons.add),
          onPressed: () {
            customShowBottomSheet(context, controller.formState,
                controller.text, (val) {}, "add status", "add", () {
              controller.addStatus();
            });
          }),
      body: GetBuilder<PersonalStatusController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(top: 20, bottom: 5),
                    child: const Text("CURRENTLY SET TO")),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      // Show Model Bottom Sheet
                      if (controller.ind == null) {
                        Get.defaultDialog(
                            title: "message",
                            middleText: "please select status to edit .");
                      } else {
                        customBottomSheet(
                          context,
                          controller.formState,
                          controller.previousText,
                          (value) {
                            controller.onChanged(value);
                          },
                          controller.previousText.text,
                          () {
                            Get.back();
                          },
                          () {
                            controller.editStatus(
                              controller.personalStatusModel[controller.ind!]
                                  .statusId!,
                              controller.previousText.text,
                            );
                          },
                          120 -
                              controller.countLetters(
                                controller.previousText.text +
                                    controller.text.text,
                              ),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(
                        // ?? controller.selectText ?? controller.personalStatusModel[controller.ind!].text
                        controller.myServices.sharedPref.getString("save") ??
                            controller.myServices.sharedPref
                                .getString("saveAgain") ??
                            "",
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.only(top: 30, bottom: 5),
                  child: const Text("SELECT YOUR ABOUT"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.personalStatusModel.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(controller.personalStatusModel[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        controller.deleteStatus(
                            controller.personalStatusModel[index].statusId!);
                      },
                      background: Container(
                        color: Colors.green,
                        child: const Icon(
                          Icons.check,
                          color: AppColor.backGround,
                        ),
                      ),
                      child: Container(
                        color: Colors.grey.shade100,
                        child: ListTile(
                          title: InkWell(
                            onTap: () {
                              if (controller
                                      .personalStatusModel[index].select ==
                                  false) {
                                /* controller.group
                                    .add(controller.personalStatusModel[index]); */

                                controller.personalStatusModel[index].select =
                                    true;
                              }
                              /* else {
                                controller.group.remove(
                                    controller.personalStatusModel[index]);
                                controller.personalStatusModel[index].select =
                                    false;
                              } */
                              //controller.changeValue(index);
                              controller.changeValueCheck(
                                  controller.personalStatusModel[index].text!);
                              controller.ind = index;
                              print(
                                  "this ========================================= ${controller.ind}");
                            },
                            child: Text(
                                "${controller.personalStatusModel[index].text}"),
                          ),
                          trailing: controller.myServices.sharedPref
                                          .getString("save") ==
                                      controller
                                          .personalStatusModel[index].text ||
                                  controller.myServices.sharedPref
                                          .getString("saveAgain") ==
                                      controller.personalStatusModel[index].text
                              ? const Icon(
                                  Icons.check,
                                  color: AppColor.blueDark,
                                )
                              : null,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
