class MessageModel {
  late Type type;
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
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
    senderId = json['senderId'] ?? '';
    message = json['message'] ?? '';
    receiverId = json['receiverId'] ?? '';
    dateTime = json['dateTime'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'text': type.name,
      'senderId': senderId,
      'message': message,
      'receiverId': receiverId,
      'dateTime': dateTime,
    };
  }
}

enum Type { text, image }
