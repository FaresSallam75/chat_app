/* 
import 'package:chat_app/controller/calling_controller/video_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class RemoteUserVideo extends StatelessWidget {
  const RemoteUserVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoCallController>(
      builder: (controller) =>  controller.remoteUid != 0
          ? RtcRemoteView.SurfaceView(
              uid: controller.remoteUid,
              channelId: controller.channel,
            )
          : const Text("Calling" , textAlign: TextAlign.center,),
    );
  }
}


 */