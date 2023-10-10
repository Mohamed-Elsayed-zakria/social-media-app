class CreateAccount {
  String personalPageUrl;
  String username;
  String firstName;
  String lastName;
  String personUid;
  String age;
  String gender;
  String personalPicture;
  String? token;
  double latitude;
  double longitude;
  String bio;
  bool isOnline;
  bool verified;
  List followers;
  List following;
  List listBlock;
  String coverPhoto;

  CreateAccount({
    required this.personalPageUrl,
    required this.latitude,
    required this.longitude,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.personUid,
    required this.age,
    required this.gender,
    required this.personalPicture,
    required this.token,
    required this.bio,
    required this.isOnline,
    required this.verified,
    required this.followers,
    required this.following,
    required this.listBlock,
    required this.coverPhoto,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['personalPageUrl'] = personalPageUrl;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['personUid'] = personUid;
    data['token'] = token ?? '';
    data['age'] = age;
    data['gender'] = gender;
    data['personalPicture'] = personalPicture;
    data['bio'] = bio;
    data['isOnline'] = isOnline;
    data['verified'] = verified;
    data['followers'] = followers;
    data['following'] = following;
    data['listBlock'] = listBlock;
    data['coverPhoto'] = coverPhoto;
    return data;
  }
}
