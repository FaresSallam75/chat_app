class MessageModel {
  String? messageId;
  String? time;
  String? sender;
  String? reciever;
  String? text;
  String? file;

  MessageModel(
      {this.messageId,
      this.time,
      this.sender,
      this.reciever,
      this.text,
      this.file, 
      });

  MessageModel.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'].toString();
    time = json['time'].toString();
    sender = json['sender'].toString();
    reciever = json['reciever'].toString();
    text = json['text'].toString();
    file = json['file'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['time'] = this.time;
    data['sender'] = this.sender;
    data['reciever'] = this.reciever;
    data['text'] = this.text;
    data['file'] = this.file;
    return data;
  }
}
