class PersonalStatusModel {
  String? statusId;
  String? usersId;
  String? text;
  String? date;
  bool select = false;

  PersonalStatusModel(
      {this.statusId, this.usersId, this.text, this.date, this.select = false});

  PersonalStatusModel.fromJson(Map<String, dynamic> json) {
    statusId = json['status_id'].toString();
    usersId = json['users_id'].toString();
    text = json['text'].toString();
    date = json['date'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_id'] = this.statusId;
    data['users_id'] = this.usersId;
    data['text'] = this.text;
    data['date'] = this.date;
    return data;
  }
}
