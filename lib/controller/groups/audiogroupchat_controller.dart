import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/controller/camera/camera_controller.dart';
import 'package:get/get.dart';

class AudioGroupChatController extends GetxController {


  CameraControllerImp cameraControllerImp = Get.find();
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;
  bool isRecording = false;
  File? audioPath;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int? ind;
    

     intialState() {
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      isPlay = state == PlayerState.playing;
      update();
    });

    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      duration = newDuration;
      update();
    });

    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      position = newPosition;
      update();
    });

    audioPlayer.onPlayerComplete.listen((event) {
      duration = Duration.zero;
      position = Duration.zero;
      // ignore: void_checks
      event = PlayerState.stopped;
    });
  }

  Future<void> playRecord(String url) async {
    try {
      isPlay = true;
      update();
      audioPlayer.play(UrlSource(url));
      print("this is url ----------------------------------> $url");
    } catch (e) {
      print("exception play =============================== $e");
    }
  }

  Future<void> pauseRecord() async {
    try {
      isPlay = false;
      update();
      await audioPlayer.pause();
    } catch (e) {
      print("exception pause =============================== $e");
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

}