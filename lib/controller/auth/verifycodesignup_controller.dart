import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/authdata/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode(String code);
  resendCode();
  goToSuccessSignUp(String verifyCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  String? verifyCode;
  StatusRequest statusRequest = StatusRequest.none;
  String? checkIndex;

  @override
  void onInit() {
    super.onInit();
    email      = Get.arguments['email'];
    checkIndex = Get.arguments['one'];
    getNotifyCode();
  }

  @override
  goToSuccessSignUp(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.successSignUp, arguments: {"one": checkIndex});
      } else {
        Get.defaultDialog(
          title: "Watchout",
          middleText: "Verify Code Not Correct",
        );
        verifyCode;
      }
    }
    update();
  }

  getNotifyCode() async {
    //statusRequest = StatusRequest.loading;
    // update();
    var response = await verifyCodeSignUpData.getNotifyVerifyCode(email!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void checkCode(code) {
    verifyCode != code;
    code = "";
    update();
  }

  @override
  resendCode() {
    getNotifyCode();
    verifyCodeSignUpData.resendData(email!);
    update();
  }
}
