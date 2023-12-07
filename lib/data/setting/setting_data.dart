import 'dart:io';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';


class SettingData {
  Crud crud;
  SettingData(this.crud);

  editSettings(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.editSetting, data);
    } else {
      response = await crud.postRequestWithFile(AppLink.editSetting, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
  

   viewDataSetting(String userid) async {
    var response = await crud.postData(AppLink.viewSetting, {
        "id" : userid
    });
    return response.fold((l) => l, (r) => r);
  } 



}
