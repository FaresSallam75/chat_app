/* import 'package:chat_app/data/model/usersmessagesmodel.dart';
import 'package:chat_app/public/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioCallController extends GetxController {

  MyServices myServices = Get.find();
  String appId = "cc9d6bc6c9c3460c85f7c8f4c6f1d931";
  String channel = "chatsapp";
  String tempToken =
      "007eJxTYCi3Z31meH5vOcfaC58THy4w+q1iE58cVnHp7wGLe43TFyxQYEhOtkwxS0o2S7ZMNjYxM0i2ME0zT7ZIM0k2SzNMsTQ2PHvqfEpDICNDy43XLIwMjAwsQAziM4FJZjDJAiY5GJIzEkuKEwsKGBgANIonWA==";

  int remoteUid = 0;
  bool localUserJoined = false;
  late final RtcEngine engine;

  @override
  void onInit() {
    initAgora();
    super.onInit();
  }

  @override
  void dispose() {
    engine.disableAudio();
    super.dispose();
  }

  Future<void> initAgora() async {
    try {
      await [Permission.microphone, Permission.camera].request();
      engine = await RtcEngine.create(appId);
      await engine.enableAudio();
      engine.setEventHandler(
        RtcEngineEventHandler(
          joinChannelSuccess: ( channel,  uid,  elapsed) {
           
             localUserJoined = true;
             update();
          },
          userJoined: ( uid, int elapsed) {
            remoteUid = uid;
            update();
          },
          userOffline: ( uid, UserOfflineReason reason) {
            remoteUid = 0;
            update();
            Get.back();
          },
        ),
      );
      await engine.joinChannel(tempToken, channel, null, 0);
    }  on PlatformException  catch (e) {
      print("exception =============================== $e");
    }
  }

  // <uses-permission android:name="android.permission.READ_PRIVILEGED_PHONE_STATE"tools:ignore="ProtectedPermissions" />

  /* Future<void> initAgora() async {
    // retrieve permissions
    try {
      await [Permission.microphone, Permission.camera].request();

      //create the engine
      engine = createAgoraRtcEngine();

      await engine.initialize(RtcEngineContext(
        appId: appID,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ));

      engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            print("local user ${connection.localUid} joined");

            localUserJoined = true;
            update();
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print("remote user $remoteUid joined");

            remoteUid = remoteUid;
            update();
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            print("remote user $remoteUid left channel");

            remoteUid = 0;
            update();
          },
        ),
      );

      await engine.enableVideo();

      await engine.joinChannel(
        token: tempToken,
        channelId: channel,
        uid: 0,
        options: const ChannelMediaOptions(),
      );
    } catch (e) {
      print("exception ================   $e");
    }
  } */
}
 */