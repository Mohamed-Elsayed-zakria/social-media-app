import '../constant/default_personal_images.dart';

class CurrentUserData {
  static String personalPicture = DefaultPersonalImage.urlPhotoMale;
  static String coverPhoto = DefaultPersonalImage.urlCoverPhoto;
  static String username = "username";
  static bool verified = false;
  static String bio = "welcome to my profile";
  static List listBlock = [];

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    coverPhoto = json['coverPhoto'];
    listBlock = json['listBlock'];
    username = json['username'];
    verified = json['verified'];
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
  CurrentUserData.takeVerified(bool newVerified) {
    verified = newVerified;
  }
  CurrentUserData.takeBio(String newBio) {
    bio = newBio;
  }
  CurrentUserData.takeListBlock(List newListBlock) {
    listBlock = newListBlock;
  }
}
