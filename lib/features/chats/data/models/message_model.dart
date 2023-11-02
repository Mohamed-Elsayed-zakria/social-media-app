class MessageModel {
  late String type;
  late String senderId;
  late String message;
  late String receiverId;
  late String dateTime;
  late String isRead;
  late String? videoUrl;
  late List imgUrl;
  late bool isDelivered;

  MessageModel({
    required this.type,
    required this.senderId,
    required this.message,
    required this.receiverId,
    required this.dateTime,
    required this.videoUrl,
    required this.imgUrl,
    required this.isDelivered,
    required this.isRead,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    senderId = json['senderId'] ?? '';
    message = json['message'] ?? '';
    receiverId = json['receiverId'] ?? '';
    dateTime = json['dateTime'] ?? '';
    isRead = json['isRead'] ?? '';
    videoUrl = json['videoUrl'] ?? '';
    imgUrl = json['imgUrl'] ?? [];
    isDelivered = json['isDelivered'] ?? false;
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
      'isDelivered': isDelivered,
      'isRead': isRead,
    };
  }
}

enum TypeChatMessage { text, image, video }
