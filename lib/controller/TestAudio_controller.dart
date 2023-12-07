/* import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPlayerController extends GetxController {
 late FlutterSoundRecorder recordingSession;
  final recordingPlayer = AssetsAudioPlayer();
  String? pathToAudio;

  void initializer() async {
    pathToAudio = '/sdcard/Download/temp.wav';
    recordingSession = FlutterSoundRecorder();
    await recordingSession.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> startRecording() async {
    Directory directory = Directory(path.dirname(pathToAudio));
    if (!directory.existsSync()) {
      directory.createSync();
    }
    recordingSession.openAudioSession();
    await recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription _recorderSubscription =
        _recordingSession.onProgress.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(
      e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      setState(() {
        _timerText = timeText.substring(0, 8);
      });
    });
    _recorderSubscription.cancel();
  }

  @override
  void onInit() {
    initializer();
    super.onInit();
  }




}
 */