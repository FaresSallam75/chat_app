
class GroupModelTwo {
  String? groupId;
  String? groupName;
  String? userCreate;
  String? dateCreate;
  String? maximum;

  GroupModelTwo(
      {this.groupId,
      this.groupName,
      this.userCreate,
      this.dateCreate,
      this.maximum});

  GroupModelTwo.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'].toString();
    groupName = json['group_name'].toString();
    userCreate = json['user_create'].toString();
    dateCreate = json['date_create'].toString();
    maximum = json['maximum'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    data['user_create'] = this.userCreate;
    data['date_create'] = this.dateCreate;
    data['maximum'] = this.maximum;
    return data;
  }
}