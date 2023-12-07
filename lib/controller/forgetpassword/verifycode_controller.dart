import 'package:chat_app/core/class/rootesname.dart';
import 'package:chat_app/core/functions/handligdata.dart';
import 'package:chat_app/core/functions/statusreques.dart';
import 'package:chat_app/data/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  String? verifyCode;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments['email'];
    getNotifyCode();
    super.onInit();
  }

  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "Watchout",
          middleText: "Verify Code Not Correct",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void checkCode(code) {
    verifyCode != code;
    code = "";
    update();
  }

  getNotifyCode() async {
    statusRequest = StatusRequest.loading;
    // update();
    var response =
        await verifyCodeForgetPasswordData.getNotifyVerifyCode(email!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  resendCode() {
    getNotifyCode();
    verifyCodeForgetPasswordData.resendData(email!);
    update();
  }
}
