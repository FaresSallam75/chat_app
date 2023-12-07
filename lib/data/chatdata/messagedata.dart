import 'dart:io';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class MessageData {
  Crud crud;
  MessageData(this.crud);

  sendMessageData(Map data, [File? file]) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (file == null) {
      response = await crud.postData(
        AppLink.sendMessages,
        data,
      );
    } else {
      response =
          await crud.postRequestWithFile(AppLink.sendMessages, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  getMessages(String sender, String reciever) async {
    var response = await crud.postData(
        AppLink.getMessages, {"sender": sender, "reciever": reciever});
    return response.fold((l) => l, (r) => r);
  }

  getAllPhotos(String sender, String reciever) async {
    var response = await crud.postData(
        AppLink.getAllPhoto, {"sender": sender, "reciever": reciever});
    return response.fold((l) => l, (r) => r);
  }

  deleteFileData(String messageId, [String? file]) async {
    var response = await crud.postData(
        AppLink.deleteFileMessage, {"messageid": messageId, "file": file});
    return response.fold((l) => l, (r) => r);
  }

  getAllUsers(String usersId) async {
    var response = await crud.postData(AppLink.getUsers, {"usersId": usersId});
    return response.fold((l) => l, (r) => r);
  }

  getUsersMesssages(String userid) async {
    var response =
        await crud.postData(AppLink.getUsersMessage, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  search(String search) async {
    var response =
        await crud.postData(AppLink.searchUsersMessage, {"search": search});
    return response.fold((l) => l, (r) => r);
  }

  deleteAllChat(String sender, String reciever, [String? file]) async {
    var response = await crud.postData(AppLink.deleteAllChat,
        {"sender": sender, "reciever": reciever, "file": file});
    return response.fold((l) => l, (r) => r);
  }

  getTotalCountUsers(String usersId) async {
    var response =
        await crud.postData(AppLink.getTotalCountUsers, {"usersId": usersId});
    return response.fold((l) => l, (r) => r);
  }
}
