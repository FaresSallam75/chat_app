import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/groups/groupdata.dart';
import 'package:chat_app/data/model/viewgroupmessagesmodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:get/get.dart';

class GroupChatDetailsController extends GetxController {
  late ViewGroupMessagesModel viewGroupMessagesModel;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GroupData groupData = GroupData(Get.find());
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;
  List<ViewGroupMessagesModel> listPhoto = [];
  int? index;

  @override
  void onInit() {
    super.onInit();
    viewGroupMessagesModel = Get.arguments['viewGroupMessagesModel'];
   
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
    var response = await groupData.getAllPhotos(viewGroupMessagesModel.sender!,viewGroupMessagesModel.groupId!);
    print("json from controller ================ $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response['data'];
        listPhoto.addAll(responseData.map((e) => ViewGroupMessagesModel.fromJson(e)));
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
