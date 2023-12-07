import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/model/personalstatusmodel.dart';
import 'package:chat_app/data/setting/personalstatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalStatusController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  PersonalStatusData personalStatusData = PersonalStatusData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController text;
  late TextEditingController previousText;
  List<PersonalStatusModel> personalStatusModel = [];
  //String? selectText;
 // String? selectStatusId;
  List group = [];
  int? ind;
  List responseBody = [];
  // int getCount = 0;

  @override
  void onInit() {
    super.onInit();
    viewStatus();

    text         = TextEditingController();
    previousText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    text.dispose();
    previousText.dispose();
  }

  /* changeValue(int ind) {
    statusRequest = StatusRequest.loading;
    update();
    // ignore: unnecessary_null_comparison
    if (ind != null) {
      index = ind;
    } else {
      index;
    }
    statusRequest = StatusRequest.success;
    update();
  } */

  addStatus() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await personalStatusData.addPersonalStatus(
        myServices.sharedPref.getString("id")!, text.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewStatus();
        text.clear();
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  changeValueCheck(String val) {
    // selectText = "";
   // selectText = val;
    myServices.sharedPref.setString("save", val);
    myServices.sharedPref.remove("save");
    myServices.sharedPref.setString("saveAgain", val);
  
    previousText.text = myServices.sharedPref.getString("save") ??
        myServices.sharedPref.getString("saveAgain") ??
        "";
    update();
  }

  viewStatus() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await personalStatusData
        .viewPersonalStatus(myServices.sharedPref.getString("id")!);
    print("response ========================================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        personalStatusModel.clear();
        responseBody = response['data'];

        personalStatusModel
            .addAll(responseBody.map((e) => PersonalStatusModel.fromJson(e)));

        // selectText = responseBody[0]['text'];
        // selectStatusId = responseBody[0]['status_id'].toString();
      } else {
        statusRequest = StatusRequest.failure;
        myServices.sharedPref.remove("save");
        myServices.sharedPref.remove("saveAgain");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  editStatus(String statusId, String text) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await personalStatusData.editPersonalStatus(statusId, text);
    print("response ========================================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewStatus();
        myServices.sharedPref.remove("save");
        myServices.sharedPref.setString("saveAgain", text);
        Get.back();
        // previousText.clear();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteStatus(String statusId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await personalStatusData.deletePersonalStatus(statusId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewStatus();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  int countLetters(String text) {
    update();
    int count = 0;
    for (int i = 0; i < text.length; i++) {
      if (text[i].toUpperCase() != text[i].toLowerCase()) {
        count++;
        print("counter  ====================================== ${120 - count}");
      }
    }
    update();
    return count;
  }

  onChanged(String value) {
    if (value.isNotEmpty) {
      countLetters(value);
      print("value ======================================= $value");
      update();
    }
  }
}
