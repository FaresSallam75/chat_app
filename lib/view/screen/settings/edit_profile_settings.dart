import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/setting/edit_profile_setting_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/view/widget/setting/editprofilesetting/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileSetting extends GetView<EditProfileSettingController> {
  const EditProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileSettingController());

    return Scaffold(
      body: GetBuilder<EditProfileSettingController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.goToBack();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: AppColor.blueDark,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context)
                            .textTheme
                            // ignore: deprecated_member_use
                            .headline1!
                            .copyWith(color: AppColor.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                        onTap: () {
                          controller.changeDataProfile();
                        },
                        child: controller.isTyping
                            ? const Text(
                                "Done",
                                style: TextStyle(
                                    color: AppColor.blueDark, fontSize: 16),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColor.grey.withOpacity(0.2),
                child: Form(
                  //  key: controller.formState,
                  child: CustomEditProfile(
                    onTapTwo: () {
                      controller
                          .goToPageEditProfileDetails(controller.userModel);
                    },
                    onTap: () {
                      controller
                          .goToPageEditProfileDetails(controller.userModel);
                    }, // CachedNetworkImageProvider
                    image: CachedNetworkImageProvider(
                      controller.userModel.usersImage != ""
                          ? "${AppLink.imageUsers}/${controller.userModel.usersImage}"
                          : AppLink.defaultErrorImage,
                    ),

                    onTabVal: () {
                      controller.changeVal();
                    },
                    onTapOutside: (PointerDownEvent val) {
                      controller.change(val);
                    },
                    myController: controller.name,
                    text: " Edit",
                    hint: "${controller.userModel.usersName}", // ===>
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 25, bottom: 10),
                child: const Text("PHONE NUMBER"),
              ),
              Container(
                color: AppColor.grey.withOpacity(0.2),
                child: const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.black,
                      ),
                    ),
                    hintText: '+201062873239',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 25, bottom: 10),
                child: const Text("ABOUT"),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRotes.personalStatus);
                },
                child: Container(
                  color: AppColor.grey.withOpacity(0.2),
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        controller.myServices.sharedPref.getString("save") ??
                            controller.myServices.sharedPref
                                .getString("saveAgain") ??
                            "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
