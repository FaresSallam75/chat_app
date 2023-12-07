import 'package:chat_app/applinks.dart';
import 'package:chat_app/core/class/crud.dart';

class PersonalStatusData {
  Crud crud;
  PersonalStatusData(this.crud);

  addPersonalStatus(String usersId, String text) async {
    var response = await crud.postData(
        AppLink.addPersonalstatus, {"usersId": usersId, "text": text});
    return response.fold((l) => l, (r) => r);
  }
  viewPersonalStatus(String usersId) async {
    var response = await crud.postData(
        AppLink.viewPersonalstatus, {"usersId": usersId});
    return response.fold((l) => l, (r) => r);
  } 
  
  editPersonalStatus(String statusId, String text) async {
    var response = await crud.postData(
        AppLink.editPersonalstatus, {"statusId": statusId, "text" : text});
    return response.fold((l) => l, (r) => r);
  } 

  deletePersonalStatus(String statusId) async {
    var response = await crud.postData(
        AppLink.deletePersonalstatus, {"statusId": statusId});
    return response.fold((l) => l, (r) => r);
  }
}
