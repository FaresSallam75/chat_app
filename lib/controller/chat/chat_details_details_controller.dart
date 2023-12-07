import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/chatdata/messagedata.dart';
import 'package:chat_app/data/model/messagemodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:get/get.dart';

class ChatDetailsDetailsController extends GetxController {
  late MessageModel messageModel;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  MessageData messageData = MessageData(Get.find());
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;
  List<MessageModel> listPhoto = [];
  late String sender;
  late String reciver;
  late String photo;
  int? index;

  @override
  void onInit() {
    super.onInit();
    messageModel = Get.arguments['messagemodel'];
    sender = messageModel.sender.toString();
    reciver = messageModel.reciever.toString();
    photo = messageModel.file.toString();
    getAllPhotosData();
  }

  changeValue(int ind) {
    // ignore: unnecessary_null_comparison
    if (ind != null) {
      index = ind;
      update();
    } else {
      index ;
      update();
    }
  }

  getAllPhotosData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await messageData.getAllPhotos(sender, reciver);
    print("json from controller ================ $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response['data'];
        listPhoto.addAll(responseData.map((e) => MessageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> playRecord(String url) async {
    isPlay = true;
    update();
    audioPlayer.play(DeviceFileSource(url));
    print("this is url ----------------------------------> $url");
  }

  Future<void> pauseRecord() async {
    isPlay = false;
    update();
    await audioPlayer.pause();
  }
}
