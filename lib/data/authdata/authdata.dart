import 'dart:io';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class AuthData {
  
  Crud crud;
  AuthData(this.crud);
  postData( String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }  

    sendData(Map data, [File? file]) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.signup, data);
    } else {
      response = await crud.postRequestWithFile(AppLink.signup, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

   search(String search) async {
    var response = await crud.postData(AppLink.searchUser, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
