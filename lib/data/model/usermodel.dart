class UsersModel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersImage;
  String? usersVerifcode;
  String? usersApprove;
  String? usersCreate;
  String? seen;
  bool select = false;

  UsersModel({
    this.usersId,
    this.usersName,
    this.usersPassword,
    this.usersEmail,
    this.usersPhone,
    this.usersImage,
    this.usersVerifcode,
    this.usersApprove,
    this.usersCreate,
    this.seen,
    this.select = false,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersPassword = json['users_password'].toString();
    usersEmail = json['users_email'].toString();
    usersPhone = json['users_phone'].toString();
    usersImage = json['users_image'].toString();
    usersVerifcode = json['users_verifcode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    seen = json['seen'].toString();
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
    data['seen'] = this.seen;
    return data;
  }
}
