import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
