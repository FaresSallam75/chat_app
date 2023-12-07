import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

//ChatWithUsersController controller = Get.find();

requestPermissionNotifications() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmsConfigration() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==================== Notifications  ================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    if (Get.currentRoute == "/verifycodesignup") {
      Get.snackbar(
          duration: const Duration(seconds: 3),
          message.notification!.title!,
          message.notification!.body!);
    } else if (Get.currentRoute == "/verifycode") {
      Get.snackbar(
          duration: const Duration(seconds: 3),
          message.notification!.title!,
          message.notification!.body!);
    } /* else {
      // Get.snackbar(message.notification!.title!, message.notification!.body!);
    } */
    refreshOrderNotification(message.data);
  });
}

refreshOrderNotification(data) {
  print("pade id ============================");
  data['pageid'];
  print("pade name ============================");
  data['pagename'];
  if (Get.currentRoute == "/verifycodesignup" &&
      data['pagename'] == "refresh") {
  } else if (Get.currentRoute == "/verifycode" &&
      data['pagename'] == "refresh") {}
}

/* fcmsConfigration() {
  String currentUser = controller.myServices.sharedPref.getString("id")!;
  FirebaseMessaging.onMessage.listen((message) async {
    print("==================== Notifications  ================");
    print(message.notification!.title);
    print(message.notification!.body);
    /* if (one == two ) {
      FlutterRingtonePlayer.play(fromAsset: "assets/notify/send.mp3");
      refreshMessagesNotification(message.data);
    } */
    // FirebaseMessaging.instance.subscribeToTopic("chat${controller.reciever}");
    if (currentUser != controller.reciever) {
      FlutterRingtonePlayer.play(fromAsset: "assets/notify/notify.mp3");
      refreshMessagesNotification(message.data);
    }
  });
}

refreshMessagesNotification(data) {
  print("pade id ============================");
  data['pageid'];
  print("pade name ============================");
  data['pagename'];

  print("current Rote  ${Get.currentRoute} ========================= ");
  if (Get.currentRoute == "/chatpagewithusers" &&
      data['pagename'] == "refresh") {
    controller.getMessagesData(controller.sender);
  } else if (Get.currentRoute == "/verifycodesignup" &&
      data['pagename'] == "refresh") {}
} */
