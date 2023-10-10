class BlockUserModel {
  late String personalPicture;
  late String personalUid;
  late String username;

  BlockUserModel({
    required this.personalUid,
    required this.personalPicture,
    required this.username,
  });

  BlockUserModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    personalUid = json['personUid'];
    username = json['username'];
  }
}
