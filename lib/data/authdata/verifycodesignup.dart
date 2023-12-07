import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  getNotifyVerifyCode(String email) async {
    var response = await crud.postData(AppLink.getNotifyVerifyCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendCodeForgetPassword, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
