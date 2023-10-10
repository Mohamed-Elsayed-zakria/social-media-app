class SearchModel {
  late String personalPicture;
  late String username;
  late String firstName;
  late String lastName;
  late String personUid;
  late bool verified;

  SearchModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    personUid = json['personUid'];
    verified = json['verified'];
  }
}
