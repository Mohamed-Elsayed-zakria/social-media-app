class UserChatData {
  late String username;
  late String personUid;
  late String token;
  late String personalPicture;
  late bool isOnline;
  late bool verified;
  late List listBlock;

  UserChatData({
    required this.username,
    required this.token,
    required this.personUid,
    required this.personalPicture,
    required this.isOnline,
    required this.verified,
    required this.listBlock,
  });
  UserChatData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    personUid = json['personUid'];
    token = json['token'] ?? '';
    personalPicture = json['personalPicture'];
    isOnline = json['isOnline'];
    verified = json['verified'];
    listBlock = json['listBlock'];
  }
}
