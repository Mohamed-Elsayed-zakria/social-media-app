class ProfileScreenModel {
  late List followersList;
  late List listBlock;
  late bool verified;
  late int followersCount;
  late int followingCount;
  late String personalPageUrl;
  late String coverPhoto;
  late String personalPicture;
  late String personalUid;
  late String username;
  late String firstName;
  late String lastName;
  late String token;
  late String bio;

  ProfileScreenModel({
    required this.followersList,
    required this.personalPageUrl,
    required this.personalUid,
    required this.listBlock,
    required this.followersCount,
    required this.verified,
    required this.followingCount,
    required this.coverPhoto,
    required this.personalPicture,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.bio,
  });

  ProfileScreenModel.fromJson(Map<String, dynamic> json) {
    personalPageUrl = json['personalPageUrl'];
    followersList = json['followers'];
    listBlock = json['listBlock'];
    verified = json['verified'];
    followersCount = json['followers'].length;
    followingCount = json['following'].length;
    coverPhoto = json['coverPhoto'];
    personalPicture = json['personalPicture'];
    personalUid = json['personUid'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    token = json['token'];
    bio = json['bio'];
  }
}
