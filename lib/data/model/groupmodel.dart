class GroupModel {
  String? groupId;
  String? groupName;
  String? userCreate;
  String? dateCreate;

  GroupModel({
    this.groupId,
    this.groupName,
    this.userCreate,
    this.dateCreate,
  });

  GroupModel.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'].toString();
    groupName = json['group_name'].toString();
    userCreate = json['user_create'].toString();
    dateCreate = json['date_create'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    data['user_create'] = this.userCreate;
    data['date_create'] = this.dateCreate;

    return data;
  }
}
