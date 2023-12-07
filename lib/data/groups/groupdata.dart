import 'dart:io';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class GroupData {
  Crud crud;
  GroupData(this.crud);

  addGroup(String name, String user) async {
    var response = await crud
        .postData(AppLink.createGroups, {"name": name, "usercreate": user});
    return response.fold((l) => l, (r) => r);
  }

  addRecieverGroup(String groupId, String sender, String reciever) async {
    var response = await crud.postData(AppLink.addRecieverGroup,
        {"groupId": groupId, "sender": sender, "reciever": reciever});
    return response.fold((l) => l, (r) => r);
  }

  removeRecieverGroup(String sender, String reciever, String groupId) async {
    var response = await crud.postData(AppLink.removeRecieverGroup,
        {"sender": sender, "reciever": reciever, "groupId": groupId});
    return response.fold((l) => l, (r) => r);
  }

  viewGroups(String sender) async {
    var response = await crud
        .postData(AppLink.viewGroups, {"sender": sender});
    return response.fold((l) => l, (r) => r);
  }

  viewGroupsChat(String userId) async {
    var response =
        await crud.postData(AppLink.viewGroupsChat, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  viewGroupReciever(String groupId) async {
    var response =
        await crud.postData(AppLink.viewGroupReciever, {"groupId": groupId});
    return response.fold((l) => l, (r) => r);
  }

  viewGroupMessages(String groupId) async {
    var response =
        await crud.postData(AppLink.viewGroupMessages, {"groupId": groupId});
    return response.fold((l) => l, (r) => r);
  }

  sendMessage(Map data, [File? file]) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.sendGroupMessages, data);
    } else {
      response =
          await crud.postRequestWithFile(AppLink.sendGroupMessages, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteGroup(String groupId, String userId) async {
    var response = await crud
        .postData(AppLink.deleteGroup, {"groupId": groupId, "userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteMessageGroup(String messageId, [String? file]) async {
    var response = await crud.postData(
        AppLink.deletemessagegroup, {"messageId": messageId, "file": file});
    return response.fold((l) => l, (r) => r);
  } 

    getAllPhotos(String sender, String groupId) async {
    var response = await crud.postData(
        AppLink.getAllPhotoInGroup, {"sender": sender, "groupId": groupId});
    return response.fold((l) => l, (r) => r);
  }
}
