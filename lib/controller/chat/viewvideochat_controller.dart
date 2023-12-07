import 'dart:io';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ViewVideoChatController extends GetxController {
  late VideoPlayerController videoPlayerController;
  File? videoPathChatUsers;

  @override
  void onInit() {
    super.onInit();
    videoPathChatUsers = Get.arguments['video'];
    print(
        "this path from Contrlller =====================> $videoPathChatUsers");

    videoPathPlay(videoPathChatUsers);
  }

  @override
  void dispose() {
    videoPlayerController.removeListener(videoPlayerListener);
    videoPlayerController.dispose();
    super.dispose();
  }

  void videoPlayerListener() {
    if (videoPlayerController.value.position >=
        videoPlayerController.value.duration) {
      videoPlayerController.pause();
      update();
    }
  }

  videoPathPlay(url) {
    // ignore: deprecated_member_use
    videoPlayerController = VideoPlayerController.file(videoPathChatUsers!)
      ..initialize().then((_) {
        videoPlayerController.seekTo(const Duration(seconds: 3));
        videoPlayerController.setVolume(1.0);
        videoPlayerController.addListener(videoPlayerListener);
        videoPlayerController.initialize();

        videoPlayerController.play();

        update();
      });
  }

  playVideo() {
    videoPlayerController.value.isPlaying
        ? videoPlayerController.pause()
        : videoPlayerController.play();
    update();
  }
}
