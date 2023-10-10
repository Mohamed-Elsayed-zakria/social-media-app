class LikesModel {
  late String personalPicture;
  late String username;
  late bool verified;
  late String personUid;

  LikesModel({
    required this.personalPicture,
    required this.username,
    required this.verified,
    required this.personUid,
  });
  LikesModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    username = json['username'];
    personUid = json['personUid'];
    verified = json['verified'];
  }
}
