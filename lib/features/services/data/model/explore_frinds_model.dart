class ExploreFrindsModel {
  late bool verified;
  late String personalPicture;
  late String personalUid;
  late String username;
  late String firstName;
  late String lastName;

  ExploreFrindsModel({
    required this.personalUid,
    required this.verified,
    required this.personalPicture,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  ExploreFrindsModel.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    personalPicture = json['personalPicture'];
    personalUid = json['personUid'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }
}
