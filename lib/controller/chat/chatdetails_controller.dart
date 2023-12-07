import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/controller/chat/keyboard_controller.dart';
import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/model/messagemodel.dart';
import 'package:chat_app/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'allusers_controller.dart';

abstract class ChatDetailsController extends GetxController {
  getMessages(String reciever);
  deleteMessage(String messId);
  deleteFileMessage(String messId, String file);
}

class ChatDetailsControllerImp extends KeyboardChatController {
  late UsersModel usersModel;
  List<MessageModel> messageModel = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MessageData messageData = MessageData(Get.find());
  //late TextEditingController textEmoji;
  late String sender;
  late String reciever;
  //PublicPermissions controller = Get.put(PublicPermissions());
/*   Record record = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isRecording = false;
  bool isPlay = false;
  PlayerState? playerState;
  File? audioFile; */

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
    usersModel = Get.arguments['usermodel']!;
    sender = myServices.sharedPref.getString("id")!;
    reciever = usersModel.usersId!;
    textEmoji = TextEditingController();
    getMessages(sender, reciever);
    initState();
    intialState();
    super.onInit();
  }

  @override
  void dispose() {
    textEmoji.dispose();
    scrollController.dispose();
    // ignore: invalid_use_of_protected_member
    formState.currentState!.dispose();
    // ignore: invalid_use_of_protected_member
    FormState().dispose();
    record.dispose();
    audioPlayer.dispose();

    super.dispose();
  }

  performFunction(int index) {
    if (index == 0) {
      Get.toNamed(AppRotes.cameraPage);
    }
    if (index == 1) {
      cameraControllerImp.goToGallery(AppRotes.sendImageChat);
    }
    if (index == 2) {
      cameraControllerImp.goToFiles(AppRotes.sendImageChat);
    }
  }

  sendMessage() async {
    statusRequest = StatusRequest.loading;
    update();
    Map dataMessage = {
      "sender": myServices.sharedPref.getString("id")!,
      "reciever": reciever,
      "text": textEmoji.text
    };
    var response = await messageData.sendMessageData(
      dataMessage,
      // ignore: prefer_if_null_operators
      cameraControllerImp.fileImage ??
          cameraControllerImp.galleryFile ??
          cameraControllerImp.videoPath ??
          cameraControllerImp.fileData ??
          audioFile,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
         if (myServices.sharedPref
            .getBool(myServices.sharedPref.getString("id")!)!) {
          await audioPlayer.play(AssetSource("notify/send.mp3"));
        } else {
          await audioPlayer.play(AssetSource("notify/notify.mp3"));
        }
        //makeAnimation();
        getMessages(sender, reciever);
        cameraControllerImp.galleryFile = null;
        cameraControllerImp.fileImage = null;
        cameraControllerImp.videoPath = null;
        cameraControllerImp.fileData = null;
        audioFile = null;
        textEmoji.clear();
        sendButton = false;
        //Get.offNamed(AppRotes.chatDetails);
        // Get.back();
        // Get.back();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // Get.offNamed(AppRotes.chatPageWithUsers);

    update();
  }

  getMessages(sender, reciever) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await messageData.getMessages(sender!, reciever!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        messageModel.clear();
        List responseData = response['data'];
        messageModel.addAll(responseData.map((e) => MessageModel.fromJson(e)));
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
    getMessages(sender, reciever);
    Get.back();
  }

  goToHomePageScreen() {
    Get.offNamed(AppRotes.homePageScreen);
    AllUserControllerImp con = Get.find();
    con.getUsersWithMessages();
  }

  goToCameraPage() {
    Get.toNamed(AppRotes.cameraPage);
  }

  goToPageChatDetailsDetails(MessageModel messageModel) {
    Get.toNamed(AppRotes.chatDetailsDetails,
        arguments: {"messagemodel": messageModel});
  }

  /*  intialState() {
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
  } */

  /*  startRecording() async {
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

  /* stopRecording() async {
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
    sendMessage();
  } */

/*   Future<void> playRecord(String url) async {
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
  } */
}
