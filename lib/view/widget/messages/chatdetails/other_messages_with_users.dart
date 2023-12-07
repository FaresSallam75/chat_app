import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:chat_app/controller/chat/pdf_controller.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/data/model/messagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OtherMessageWithUsers extends GetView<ChatWithUsersController> {
  final MessageModel messageModel;
  const OtherMessageWithUsers({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    PDFController pdfController = Get.put(PDFController());
    return Column(
      children: [
        if (messageModel.text != "")
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 50),
              child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.elliptical(0, 0),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                color: Colors.white,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, top: 10, right: 10, bottom: 25),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${messageModel.text}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "sans",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 6.0,
                      child: Container(
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Jiffy(messageModel.time).format("h:mm a"),
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        if (messageModel.file!.isAudioFileName)
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 45),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                color: const Color(0xffdcf8c6),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: GetBuilder<ChatWithUsersController>(
                        builder: (controller) => Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    !controller.isPlay
                                        ? controller.playRecord(
                                            "${AppLink.audioChats}/${messageModel.file!}"
                                            // "videos/amr.m4a"
                                            )
                                        : controller.pauseRecord();
                                  },
                                  child: Icon(
                                    !controller.isPlay
                                        ? Icons.play_arrow
                                        : Icons.pause,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Slider(
                                    min: 0,
                                    max: controller.duration.inSeconds
                                        .toDouble(),
                                    value: controller.position.inSeconds
                                        .toDouble(),
                                    onChanged: (value) async {
                                      final position =
                                          Duration(seconds: value.toInt());
                                      await controller.audioPlayer
                                          .seek(position);
                                      //  await controller.audioPlayer.resume();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    controller.formatTime(controller.position)),
                                Text(controller.formatTime(
                                    controller.duration - controller.position)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 6.0,
                      child: Row(
                        children: [
                          Text(
                            Jiffy(messageModel.time).format("h:mm a"),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          /* const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.done_all,
                            size: 12,
                            color: Colors.blue,
                          ) */
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        if (messageModel.file!.isImageFileName)
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 45),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                color: const Color(0xffdcf8c6),
                child: Stack(
                  children: [ 
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          controller.goToPageChatDetailsDetails(messageModel);
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageChats}/${messageModel.file}",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 6.0,
                      child: Row(
                        children: [
                          Text(
                            Jiffy(messageModel.time).format("h:mm a"),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          /*  const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.done_all,
                            size: 12,
                            color: Colors.blue,
                          ) */
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        if (messageModel.file!.isVideoFileName)
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width - 155),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                color: Colors.blueGrey.shade900,
                child: Stack(
                  children: [
                    /* Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          var url = File(
                              "${AppLink.videoChats}/${messageModel.file}");
                          Get.toNamed(AppRotes.viewVideoChatPage,
                              arguments: {"video": url});
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ), */
                    Positioned(
                      bottom: 0.0,
                      right: 6.0,
                      child: Row(
                        children: [
                          Text(
                            Jiffy(messageModel.time).format("h:mm a"),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          /*  const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.done_all,
                            size: 12,
                            color: Colors.blue,
                          ) */
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          //  controller.playVideo();
                          File url = File(
                              "${AppLink.videoChats}/${messageModel.file}");
                          Get.toNamed(AppRotes.viewVideoChatPage,
                              arguments: {"video": url});
                        },
                        child: const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.black38,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (messageModel.file!.isPDFFileName)
          Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 45),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                color: const Color(0xffdcf8c6),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 20),
                      child: InkWell(
                        onTap: () async {
                          final file = await pdfController.loadNetwork(
                              "${AppLink.groupChataudio}/${messageModel.file}");

                          // ignore: use_build_context_synchronously
                          pdfController.openPDF(context, file.path);
                        },
                        child: SizedBox(
                          width: Get.width - 150,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                            //textBaseline: TextBaseline.ideographic,
                            children: [
                              const Icon(
                                Icons.picture_as_pdf,
                                color: AppColor.secondColor,
                                size: 30,
                              ),
                              const SizedBox(width: 5),
                              Text("${messageModel.file}",
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context).textTheme.headline3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 6.0,
                      child: Row(
                        children: [
                          Text(
                            Jiffy(messageModel.time).format("h:mm a"),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                          /* const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.done_all,
                            size: 12,
                            color: Colors.blue,
                          ) */
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
