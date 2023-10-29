class MessageModel {
  late String type;
  late String senderId;
  late String message;
  late String receiverId;
  late String dateTime;

  MessageModel({
    required this.type,
    required this.senderId,
    required this.message,
    required this.receiverId,
    required this.dateTime,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    senderId = json['senderId'] ?? '';
    message = json['message'] ?? '';
    receiverId = json['receiverId'] ?? '';
    dateTime = json['dateTime'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'senderId': senderId,
      'message': message,
      'receiverId': receiverId,
      'dateTime': dateTime,
    };
  }
}

enum Type { text, image , video}
