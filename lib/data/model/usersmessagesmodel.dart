class UsersMessagesModel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersImage;
  String? usersVerifcode;
  String? usersApprove;
  String? usersCreate;
  String? reciever;
  String? time;
  String? maximum;
  String? seen;
  String? text;
  String? file;
  String? counts;

  UsersMessagesModel({
    this.usersId,
    this.usersName,
    this.usersPassword,
    this.usersEmail,
    this.usersPhone,
    this.usersImage,
    this.usersVerifcode,
    this.usersApprove,
    this.usersCreate,
    this.reciever,
    this.time,
    this.maximum,
    this.seen,
    this.text,
    this.file,
    this.counts,
  });

  UsersMessagesModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersPassword = json['users_password'].toString();
    usersEmail = json['users_email'].toString();
    usersPhone = json['users_phone'].toString();
    usersImage = json['users_image'].toString();
    usersVerifcode = json['users_verifcode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    reciever = json['reciever'].toString();
    time = json['time'].toString();
    maximum = json['maximum'].toString();
    seen = json['seen'].toString();
    text = json['text'].toString();
    file = json['file'].toString();
    counts = json['counts'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_image'] = this.usersImage;
    data['users_verifcode'] = this.usersVerifcode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['reciever'] = this.reciever;
    data['maximum'] = this.maximum;
    data['seen'] = this.seen;
    data['text'] = this.text;
    data['file'] = this.file;
    data['counts'] = this.counts;
    return data;
  }
}
