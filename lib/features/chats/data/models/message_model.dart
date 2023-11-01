class MessageModel {
  late String type;
  late String senderId;
  late String message;
  late String receiverId;
  late String dateTime;
  late String? videoUrl;
  late List imgUrl;

  MessageModel({
    required this.type,
    required this.senderId,
    required this.message,
    required this.receiverId,
    required this.dateTime,
    required this.videoUrl,
    required this.imgUrl,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    senderId = json['senderId'] ?? '';
    message = json['message'] ?? '';
    receiverId = json['receiverId'] ?? '';
    dateTime = json['dateTime'] ?? '';
    videoUrl = json['videoUrl'] ?? '';
    imgUrl = json['imgUrl'] ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'senderId': senderId,
      'message': message,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'videoUrl': videoUrl,
      'imgUrl': imgUrl,
    };
  }
}

enum TypeChatMessage { text, image , video}
