import 'dart:io';

import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/functions/showemoji.dart';
import 'package:chat_app/view/widget/messages/chatdetails/customtextform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatWithUsersController>( 
      builder: (controller) => Container(
        padding: const EdgeInsets.all(5),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // padding: const EdgeInsets.only(right: 5.0, left: 5, top: 5),
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    controller.isRecording
                        ? Container()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => CupertinoActionSheet(
                                      actions: [
                                        ...List.generate(
                                          controller.listData.length,
                                          (index) => CupertinoActionSheetAction(
                                            onPressed: () {
                                              controller.performFunction(index);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(controller.iconData[index],
                                                    color: AppColor.blueDark),
                                                const SizedBox(width: 13),
                                                Text(
                                                  "${controller.listData[index]}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      // ignore: deprecated_member_use
                                                      .headline1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: Theme.of(context)
                                                .textTheme
                                                // ignore: deprecated_member_use
                                                .headline1!
                                                .copyWith(
                                                    color: AppColor.blueDark),
                                          )),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.add_sharp,
                                  color: Colors.blue.shade900,
                                  size: 30,
                                ),
                              ),
                              const CustomTextForm(),
                              // const Spacer(),
                              InkWell(
                                onTap: () {
                                  //controller.goToCameraPage();
                                  controller.goToCameraPage();
                                },
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                            ],
                          ),
                    //const SizedBox(width: 10),
                    controller.sendButton
                        ? Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              //padding: const EdgeInsets.all(10),
                              // height: 50,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue.shade900,
                                radius: 20,
                                child: IconButton(
                                    onPressed: () {
                                      controller.sendMessageData();
                                    },
                                    icon: const Icon(
                                      Icons.send,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        : Expanded(
                            child: GestureDetector(
                              onLongPressDown: (details) {
                                controller.isRecording = true;
                                controller.update();
                                print(
                                    "onLongPressDown =========================");
                              },
                              onTap: () {
                                controller.isRecording = false;
                                controller.update();
                                print("onTap =========================");
                              },
                              onLongPress: () {
                                controller.isRecording = true;
                                controller.update();
                                print("onLongPress =========================");
                              },
                              onLongPressUp: () {
                                controller.isRecording = false;
                                controller.update();
                                if (controller.audioFile != null) {
                                  controller.sendMessageData();
                                }
                                print(
                                    "onLongPressUp =========================");
                                print(
                                    "controller.audioPath ==================== ${controller.audioFile}");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 12.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: SocialMediaRecorder(
                                  backGroundColor: Colors.black,

                                  recordIcon: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade900,
                                    child: const Icon(
                                      Icons.mic,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  recordIconBackGroundColor:
                                      Colors.blue.shade900,
                                  recordIconWhenLockBackGroundColor:
                                      Colors.blue.shade900,
                                  sendRequestFunction: (File soundFile) {
                                    // ignore: unnecessary_null_comparison
                                    if (soundFile != null) {
                                      controller.audioFile = soundFile;
                                      //controller.sendGroupMessage();
                                      print(
                                          "ok ========================================= ");
                                      controller.isRecording = false;
                                      controller.update();
                                    } else {
                                      controller.isRecording = false;
                                      controller.update();
                                      print(
                                          "Not ok ========================================= ");
                                    }
                                  },
                                  // maxRecordTimeInSecond: 5,
                                  encode: AudioEncoderType.OPUS,
                                ),
                              ),
                            ),
                          ),
                    /*  controller.sendButton
                        ? InkWell(
                            onTap: () {
                              if (controller.responseBody.isNotEmpty) {
                                //controller.makeAnimation();
                                controller.sendGroupMessage();
                              } else {
                                Get.rawSnackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 2),
                                  title: "Message",
                                  messageText: const Text(
                                    "please add any users first",
                                    style:
                                        TextStyle(color: AppColor.backGround),
                                  ),
                                );
                              }
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue.shade900,
                              child: Icon(
                                controller.sendButton
                                    ? Icons.send_rounded
                                    : Icons.mic_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )
                        : GestureDetector(
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue.shade900,
                              child: const Icon(
                                Icons.mic_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onLongPress: () {
                              // controller.startRecording();
                            },
                            onLongPressUp: () {
                              //   controller.stopRecording();
                            },
                          ), */
                  ],
                ),
              ),
              controller.isShow
                  ? emojiSelect(
                      controller.isShow,
                      controller.sendButton,
                      controller.textEmoji,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
