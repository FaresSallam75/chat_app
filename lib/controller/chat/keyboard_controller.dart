import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:chat_app/controller/chat/audioplayerchat_controller.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardChatController extends AudioPlayerChatController {
  late ScrollController scrollController;
  bool isShow = false;
  bool sendButton = false;
  FocusNode focusNode = FocusNode();
  late TextEditingController textEmoji;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CameraControllerImp cameraControllerImp = Get.find();

  onChanged(String value) {
    if (value.isNotEmpty) {
      sendButton = true;
    } else {
      sendButton = false;
    }
    update();
  }

  /*  onEmojiChanged(String value) {
    if (value.isNotEmpty) {
      isShow = !isShow;
      sendButton = true;
    } else {
      isShow = isShow;
      sendButton = false;
    }
    update();
  } */

  showImoji() {
    isShow = !isShow;
    sendButton = true;
    focusNode.unfocus();
    focusNode.canRequestFocus = true;
    update();
  }

  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShow = false;
        update();
      }
    });
    scrollController = ScrollController();
    scrollController.addListener(() {});
  }

  makeAnimation() {
    if (sendButton) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
    }
  }

  willPopScope() {
    if (isShow) {
      isShow = false;
    } else {
      Get.back();
    }
    update();
    return Future.value(false);
  }

  /* Widget emojiSelect() {
    return Offstage(
      offstage: !isShow,
      child: SizedBox(
        height: 250,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {
            // ignore: unnecessary_null_comparison
            if (emoji == null) {
              sendButton = false;
            } else {
              textEmoji.text = textEmoji.text;
              sendButton = true;
            }
            update();
          },
          textEditingController: textEmoji,
          config: Config(
              columns: 7,
              emojiSizeMax: 32 *
                  (foundation.defaultTargetPlatform == TargetPlatform.android
                      ? 1.30
                      : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              initCategory: Category.RECENT,
              bgColor: const Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              // showRecentsTab: true,
              recentsLimit: 28,
              replaceEmojiOnLimitExceed: false,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(fontSize: 20, color: Colors.black26),
                textAlign: TextAlign.center,
              ),
              loadingIndicator: const SizedBox.shrink(),
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
              checkPlatformCompatibility: true,
              emojiTextStyle:
                  const TextStyle(fontSize: 20, color: Colors.deepOrange)),
        ),
      ),
    );
  } */
}
