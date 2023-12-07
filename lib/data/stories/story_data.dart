import 'dart:io';
import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class StoryData {
  Crud crud;
  StoryData(this.crud);

  sendDataData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.sendStory, data);
    } else {
      response = await crud.postRequestWithFile(AppLink.sendStory, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  viewStory(String userid) async {
    var response = await crud.postData(AppLink.viewStory, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  viewOtherStory(String userid) async {
    var response =
        await crud.postData(AppLink.viewOthersStory, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteStoryData(String id, [String? file]) async {
    var response =
        await crud.postData(AppLink.deleteStory, {"storyid": id, "file": file});
    return response.fold((l) => l, (r) => r);
  } 

  deleteStoryAutomatically(String storyId, [String? file]) async {
    var response =
        await crud.postData(AppLink.deleteStoryAutomatically, {"storyId": storyId, "file": file});
    return response.fold((l) => l, (r) => r);
  }

  searchUserStory(String search) async {
    var response =
        await crud.postData(AppLink.searchUserStory, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
