import 'package:agora_uikit/agora_uikit.dart';
import 'package:chat_app/controller/calling_controller/video_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoCallController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Video Call"),
          centerTitle: true,
        ),
        body: GetBuilder<VideoCallController>(
          builder: (controller) => SafeArea(
              child: Stack(
            children: [
              AgoraVideoViewer(
                client: controller.agoraClient,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
                enableHostControls: true,
              ),
              AgoraVideoButtons(
                client: controller.agoraClient,
                onDisconnect: () {
                  Get.back();
                },
                addScreenSharing: true,
                cloudRecordingEnabled: true,
                enabledButtons: const [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.toggleMic,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.switchCamera,
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
