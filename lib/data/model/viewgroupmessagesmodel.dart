class ViewGroupMessagesModel {
  String? messageId;
  String? groupId;
  String? sender;
  String? date;
  String? text;
  String? file;
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersImage;
  String? usersVerifcode;
  String? usersApprove;
  String? usersCreate;
  String? recipientId;

  ViewGroupMessagesModel(
      {this.messageId,
      this.groupId,
      this.sender,
      this.date,
      this.text,
      this.file,
      this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersImage,
      this.usersVerifcode,
      this.usersApprove,
      this.usersCreate,
      this.recipientId});

  ViewGroupMessagesModel.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'].toString();
    groupId = json['group_id'].toString();
    sender = json['sender'].toString();
    date = json['date'].toString();
    text = json['text'].toString();
    file = json['file'].toString();
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersPassword = json['users_password'].toString();
    usersEmail = json['users_email'].toString();
    usersPhone = json['users_phone'].toString();
    usersImage = json['users_image'].toString();
    usersVerifcode = json['users_verifcode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    recipientId = json['recipient_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['group_id'] = this.groupId;
    data['sender'] = this.sender;
    data['date'] = this.date;
    data['text'] = this.text;
    data['file'] = this.file;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_image'] = this.usersImage;
    data['users_verifcode'] = this.usersVerifcode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['recipient_id'] = this.recipientId;
    return data;
  }
}