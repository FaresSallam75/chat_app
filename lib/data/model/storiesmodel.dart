class StoriesModel {
  String? storyId;
  String? date;
  String? userId;
  String? text;
  String? file;
  String? caption;
  String? username;
  String? userimage;
  String? hours;

  StoriesModel(
      {this.storyId,
      this.date,
      this.userId,
      this.text,
      this.file,
      this.caption,
      this.username,
      this.userimage,
      this.hours});

  StoriesModel.fromJson(Map<String, dynamic> json) {
    storyId = json['story_id'].toString();
    date = json['date'].toString();
    userId = json['user_id'].toString();
    text = json['text'].toString();
    file = json['file'].toString();
    caption = json['caption'].toString();
    username = json['username'].toString();
    userimage = json['userimage'].toString();
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
    data['username'] = this.username;
    data['userimage'] = this.userimage;
    data['hours'] = this.hours;
    return data;
  }
}