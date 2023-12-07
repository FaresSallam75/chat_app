import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:record/record.dart';

class AudioPlayerChatController extends GetxController {
  Record record = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isRecording = false;
  bool isPlay = false;
  PlayerState? playerState;
  File? audioFile;

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
    isPlay = true;
    update();
    audioPlayer.play(UrlSource(url));
    print("this is url ----------------------------------> $url");
  }

  Future<void> pauseRecord() async {
    isPlay = false;
    update();
    await audioPlayer.pause();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }
}
