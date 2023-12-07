import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/setting/profile_setting_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalProfileSetting extends GetView<SettingController> {
  const PersonalProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: controller.userModel.length,
              itemBuilder: (context, index) {
                controller.defaultImage!
                        .contains("${controller.userModel[index].usersImage}")
                    ? print("================= one ------------------------")
                    : print("================= two ------------------------");

                return InkWell(
                  onTap: () {
                    controller.goToPageEditProfile(controller.userModel[index]);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: CachedNetworkImageProvider(controller
                                  .userModel[index].usersImage !=
                              ""
                          ? "${AppLink.imageUsers}/${controller.userModel[index].usersImage}"
                          : AppLink.defaultErrorImage),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.userModel[index].usersName}", //"Fares Sallam",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.myServices.sharedPref.getString("save") ??
                              controller.myServices.sharedPref
                                  .getString("saveAgain") ??
                              "",
                          // "🌸للقدر رأي أخر لا يشبه أحلامنا",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        print("222222222222222222222222222222222222222");
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.blueDark,
                        radius: 18,
                        child: Icon(
                          Icons.qr_code,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Container(
            padding: const EdgeInsets.only(left: 80),
            child: const Divider(color: Colors.black87, thickness: 0.2),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade900,
                  ),
                  child: const Icon(
                    Icons.emoji_emotions_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Avatar",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline3,
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
