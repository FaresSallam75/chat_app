class OtherStoriesModel {
  String? storyId;
  String? date;
  String? userId;
  String? text;
  String? file;
  String? caption;
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersImage;
  String? usersVerifcode;
  String? usersApprove;
  String? usersCreate;
  String? hours;

  OtherStoriesModel(
      {this.storyId,
      this.date,
      this.userId,
      this.text,
      this.file,
      this.caption,
      this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersImage,
      this.usersVerifcode,
      this.usersApprove,
      this.usersCreate,
      this.hours});

  OtherStoriesModel.fromJson(Map<String, dynamic> json) {
    storyId = json['story_id'].toString();
    date = json['date'].toString();
    userId = json['user_id'].toString();
    text = json['text'].toString();
    file = json['file'].toString();
    caption = json['caption'].toString();
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersPassword = json['users_password'].toString();
    usersEmail = json['users_email'].toString();
    usersPhone = json['users_phone'].toString();
    usersImage = json['users_image'].toString();
    usersVerifcode = json['users_verifcode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    hours = json['hours'].toString();  

    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['story_id'] = this.storyId;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['text'] = this.text;
    data['file'] = this.file;
    data['caption'] = this.caption;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_image'] = this.usersImage;
    data['users_verifcode'] = this.usersVerifcode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['hours'] = this.hours;
    return data;
  }
}