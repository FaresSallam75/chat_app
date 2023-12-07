// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/setting/edit_profile_detail_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/core/constant/alert_cupertino.dart';
import 'package:chat_app/core/constant/alert_cupertino_editprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileSettingDetailsController());

    return Scaffold(
      body: GetBuilder<EditProfileSettingDetailsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 30, right: 20),
                  child: Row(
                    //mainAxisSize: MainAxisSize.min,
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
                      /* InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Edit Profile",
                        style:
                            TextStyle(fontSize: 15, color: AppColor.blueDark),
                      ),
                    ), */
                      // const Spacer(),
                      Center(
                        child: Text(
                          "Edit Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.black),
                        ),
                      ),
                      //const Spacer(),
                      InkWell(
                        onTap: () {
                          showAlertEdit(context, () {}, () {}, () {
                            controller.cameraImage();
                          }, () {
                            controller.galleryImage();
                          });
                        },
                        child: Text(
                          "Edit",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                //const SizedBox(height: 40),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: controller.userModel.usersImage != ""
                        ? "${AppLink.imageUsers}/${controller.userModel.usersImage}"
                        : AppLink.defaultErrorImage,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    //height: 400,
                    width: double.infinity,
                  ),
                ),
                //const Spacer(),

                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {
                      showAlert(
                        context,
                        () {
                          controller.saveImage(
                              "${AppLink.imageUsers}/${controller.userModel.usersImage}");
                        },
                        () {},
                      );
                    },
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      color: AppColor.blueDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
