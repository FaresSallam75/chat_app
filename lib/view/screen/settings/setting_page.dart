import 'package:chat_app/controller/setting/profile_setting_controller.dart';
import 'package:chat_app/core/class/handlingdataview.dart';
import 'package:chat_app/view/widget/setting/list_generate_setting.dart';
import 'package:chat_app/view/widget/setting/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());

    return GetBuilder<SettingController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Settings",
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text("Settings",
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    const PersonalProfileSetting(),
                    const SizedBox(height: 20),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Starred Messages",
                      color: Colors.yellowAccent.shade400,
                      icon: const Icon(
                        Icons.star_purple500_outlined,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Linked Devices",
                      color: Colors.greenAccent.shade400,
                      icon: const Icon(
                        Icons.laptop,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Account",
                      color: Colors.blue.shade900,
                      icon: const Icon(
                        Icons.key_outlined,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Privacy",
                      color: Colors.blue.shade900,
                      icon: const Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Chats",
                      color: Colors.blue.shade900,
                      icon: const Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Notifications",
                      color: Colors.redAccent.shade700,
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Storage and Data",
                      color: Colors.greenAccent.shade400,
                      icon: const Icon(
                        Icons.cell_tower_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Help",
                      color: Colors.blue.shade900,
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                    ),
                    ListGenerateSettings(
                      count: 1,
                      textOne: "Tell a Friend",
                      color: Colors.redAccent.shade700,
                      icon: const Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.logout();
                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.redAccent.shade700,
                                    ),
                                    child: const Icon(Icons.arrow_back,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Logout",
                                    style:
                                        // ignore: deprecated_member_use
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
