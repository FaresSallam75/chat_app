/* import 'package:chat_app/controller/calling_controller/audio_call_controller.dart';
import 'package:chat_app/controller/chat/chatwithusers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;

class AudioCall extends StatelessWidget {
  const AudioCall({super.key});

  @override
  Widget build(BuildContext context) {
    //ChatWithUsersController con = Get.find();
    Get.put(AudioCallController());
    return GetBuilder<AudioCallController>(
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Center(
                child: controller.remoteUid != 0
                    ? Text("Calling")
                    : Text(
                        "Calling With Fares")),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.call_end,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */