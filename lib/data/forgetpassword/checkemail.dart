import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class CheckEmailData {
  
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
