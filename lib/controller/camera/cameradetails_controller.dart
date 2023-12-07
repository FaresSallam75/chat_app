import 'dart:io';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/stories/story_data.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CameraInitialDetailsController extends GetxController {
  VideoPlayerController? videoPlayerController;
  File? videoPath;
  late TextEditingController caption;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  StoryData storyData = StoryData(Get.find());

  @override
  void onInit() {
    super.onInit();
    videoPath = Get.arguments['video'];
    print("videoPath ========================================= $videoPath");
    videoPathPlay();
    caption = TextEditingController();
  }

  @override
  void dispose() {
    videoPlayerController!.removeListener(videoPlayerListener);
    videoPlayerController!.dispose();
    caption.dispose();
    super.dispose();
  }

  void videoPlayerListener() {
    if (videoPlayerController!.value.position >=
        videoPlayerController!.value.duration) {
      videoPlayerController!.pause();
      update();
    }
  }

  videoPathPlay() {
    videoPlayerController = VideoPlayerController.file(videoPath!)
      ..initialize().then((_) {
        videoPlayerController!.seekTo(const Duration(seconds: 3));
        videoPlayerController!.setVolume(1.0);
        videoPlayerController!.addListener(videoPlayerListener);
        videoPlayerController!.play();
        update();
      });
  }

  playVideo() {
    videoPlayerController!.value.isPlaying
        ? videoPlayerController!.pause()
        : videoPlayerController!.play();
    update();
  }
}
