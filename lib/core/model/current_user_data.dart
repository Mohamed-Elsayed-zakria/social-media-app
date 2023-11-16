import '../constant/default_personal_images.dart';

class CurrentUserData {
  static String personalPicture = DefaultPersonalImage.urlPhotoMale;
  static String coverPhoto = DefaultPersonalImage.urlCoverPhoto;
  static late String username;
  static late String firstName;
  static late String lastName;
  static bool verified = false;
  static String bio = "welcome to my profile";
  static List followers = [];
  static List following = [];
  static List listBlock = [];
  static List savedItems = [];

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    coverPhoto = json['coverPhoto'];
    listBlock = json['listBlock'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    verified = json['verified'];
    followers = json['followers'];
    following = json['following'];
    savedItems = json['savedItems'] ?? [];
    bio = json['bio'];
  }
  CurrentUserData.takePersonalPicture(String newPersonalPicture) {
    personalPicture = newPersonalPicture;
  }
  CurrentUserData.takeCoverPhoto(String newCoverPhoto) {
    coverPhoto = newCoverPhoto;
  }
  CurrentUserData.takeUsername(String newUsername) {
    username = newUsername;
  }

  CurrentUserData.takeFirstName(String newFirstName) {
    firstName = newFirstName;
  }
  CurrentUserData.takeLastName(String newLastName) {
    lastName = newLastName;
  }

  CurrentUserData.takeVerified(bool newVerified) {
    verified = newVerified;
  }
  CurrentUserData.takeBio(String newBio) {
    bio = newBio;
  }
  CurrentUserData.takeListBlock(List newListBlock) {
    listBlock = newListBlock;
  }

  CurrentUserData.takeFollowers(List newFollowers) {
    followers = newFollowers;
  }

  CurrentUserData.takeFollowing(List newFollowing) {
    following = newFollowing;
  }
}
