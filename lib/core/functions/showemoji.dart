import 'package:flutter/foundation.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

Widget emojiSelect(
    bool isShow, bool sendButton, TextEditingController textEmoji) {
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
          //update();
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
}
