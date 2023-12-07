import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/controller/chat/allusers_controller.dart';
import 'package:chat_app/controller/chat/keyboard_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/model/messagemodel.dart';
import 'package:chat_app/data/model/usersmessagesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ChatWithUsersController extends KeyboardChatController {
  UsersMessagesModel? usersMessagesModel;
  List<MessageModel> messageModel = [];
  GlobalKey<FormState> formStateState = GlobalKey<FormState>();
  MessageData messageData = MessageData(Get.find());
  late String sender;
  late String reciever;
  bool isVisible = false;

  late PDFViewController pdfViewController;
  int pages = 0;
  int indexPage = 0;
  int? indexUser;
  List listData = [
    "Camera",
    "Photo & Video Library",
    "Document",
    "Location",
    "Contact",
    "Poll"
  ];

  List iconData = [
    (Icons.camera_alt_outlined),
    (Icons.photo_size_select_actual_outlined),
    (Icons.document_scanner),
    (Icons.place_outlined),
    (Icons.contact_page_outlined),
    (Icons.poll_outlined),
  ];

  @override
  void onInit() {
    super.onInit();
    usersMessagesModel = Get.arguments['usersmessagesmodel'];
    sender = myServices.sharedPref.getString("id")!;
    reciever = usersMessagesModel!.usersId!;
    print("from controller =================== ${usersMessagesModel!.usersId}");
    print("reciever reciever =================== ${reciever}");
    print("sender sender =================== ${sender}");
    textEmoji = TextEditingController();
    getMessagesData(sender);
    initState();
    intialState();
    requestPermissionNotifications();
    fcmsConfigration();
  }

  @override
  void dispose() {
    textEmoji.dispose();
    scrollController.dispose();
    // ignore: invalid_use_of_protected_member
    formStateState.currentState!.dispose();
    focusNode.dispose();
    audioPlayer.dispose();
    audioPlayer.stop();
    record.dispose();
    super.dispose();
  }

  performFunction(int index) {
    if (index == 0) {
      Get.toNamed(AppRotes.cameraPage);
    }
    if (index == 1) {
      cameraControllerImp.goToGallery(AppRotes.sendImageChatUsers);
    }
    if (index == 2) {
      cameraControllerImp.goToFiles(AppRotes.sendImageChatUsers);
    }
  }

/* 
  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  void openPDF(BuildContext context, String file) {
    Get.to(() => PDFViewerPages(file: File(file)));
  } */

  sendMessageData() async {
    //  statusRequest = StatusRequest.loading;
    // update();
    Map dataMessage = {
      "sender": myServices.sharedPref.getString("id")!,
      "reciever": reciever,
      "text": textEmoji.text,
    };
    var response = await messageData.sendMessageData(
      dataMessage,
      // ignore: prefer_if_null_operators
      cameraControllerImp.fileImage ??
          cameraControllerImp.galleryFile ??
          cameraControllerImp
              .videoPath ?? //cameraControllerImp.fileChatUsers ??
          audioFile ??
          cameraControllerImp.fileData,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "indexUsers =========================================== $indexUser");
        /* if (myServices.sharedPref
            .getBool(myServices.sharedPref.getString("id")!)!) {
          audioPlayer.play(AssetSource("notify/send.mp3"));
        } */

        /* else {
          await audioPlayer.play(AssetSource("notify/notify.mp3"));
        } */
        //getMessagesData(sender);
        // isPlay = true;
        cameraControllerImp.galleryFile = null;
        cameraControllerImp.fileImage = null;
        cameraControllerImp.videoPath = null;
        cameraControllerImp.fileData = null;
        audioFile = null;
        textEmoji.clear();
        sendButton = false;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getMessagesData(String sender) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await messageData.getMessages(sender, reciever);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        messageModel.clear();
        List responseData = response['data'];
        messageModel.addAll(responseData.map((e) => MessageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  deleteMessage(messId, file) async {
    if (file != null) {
      await messageData.deleteFileData(messId, file);
    } else {
      messageData.deleteFileData(messId, "");
    }
    getMessagesData(sender);
    Get.back();
  }

  goToPageAllUsers() {
    //Get.offNamed(AppRotes.homePageScreen);
    Get.back();
    AllUserControllerImp con = Get.find();
    con.getUsersWithMessages();
  }

  goToCameraPage() {
    // Get.toNamed(AppRotes.cameraPage);
    Get.toNamed(AppRotes.cameraPage);
  }

  goToPageChatDetailsDetails(MessageModel messageModel) {
    Get.toNamed(AppRotes.chatDetailsDetails,
        arguments: {"messagemodel": messageModel});
  }

  goToMakeAudioCall() {
    Get.toNamed(AppRotes.audioCall);
  }

  goToMakeVideoCall() {
    Get.toNamed(AppRotes.videoCall);
  }

  requestPermissionNotifications() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: false,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: false,
    );
  }

  fcmsConfigration() {
    FirebaseMessaging.onMessage.listen((message) {
      print("==================== Notifications  ================");
      print(message.notification!.title);
      print(message.notification!.body);
      FlutterRingtonePlayer.playNotification();
      /*  if (Get.currentRoute == "/verifycodesignup") {
        Get.snackbar(
            duration: const Duration(seconds: 3),
            message.notification!.title!,
            message.notification!.body!);
      } else if (Get.currentRoute == "/verifycode") {
        Get.snackbar(
            duration: const Duration(seconds: 3),
            message.notification!.title!,
            message.notification!.body!);
      } else {
        Get.snackbar(message.notification!.title!, message.notification!.body!);
      } */
      if (myServices.sharedPref
          .getBool(myServices.sharedPref.getString("id")!)!) {
        audioPlayer.play(AssetSource("notify/send.mp3"));
      } else {
        audioPlayer.play(AssetSource("notify/notify.mp3"));
      }
      isPlay = true;
      refreshOrderNotification(message.data);
    });
  }

  refreshOrderNotification(data) {
    print("pade id ============================");
    data['pageid'];
    print("pade name ============================");
    data['pagename'];
    if (Get.currentRoute == "/chatpagewithusers" &&
        data['pagename'] == "refreshmessage") {
      getMessagesData(sender);
    }
  }

  // dealing with to record voice

  /* setAudio() {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    playRecord("url");
  } */

/*   startRecording() async {
    try {
      if (await record.hasPermission()) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String filePathPath = '${appDocDir.path}/my_audios.mp3';
        await record.start(encoder: AudioEncoder.AAC, path: filePathPath);
        audioPlayer.play(AssetSource("videos/start.mp3"));
        isRecording = true;
        update();
        print("start recording =============================");
      }
    } catch (e) {
      print("exception 1 $e");
    }
  } */
/* 
  stopRecording() async {
    try {
      String? filePath = await record.stop();
      audioPlayer.play(AssetSource("videos/end.mp3"));
      // audioPath = filePath!;
      //String convert = filePath!.replaceAll("m4a", "mp3");
      print("filePath =========================================   $filePath");
      // print("convert =========================================   $convert");

      audioFile = File(filePath!);
      isRecording = false;
      update();
    } catch (e) {
      print("exception 2 $e");
    }
    await Future.delayed(const Duration(seconds: 2));
    sendMessageData();
  } */
}
