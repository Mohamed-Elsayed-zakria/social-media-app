import '../constant/default_personal_images.dart';

class CurrentUserData {
  static String personalPicture = DefaultPersonalImage.urlPhotoMale;
  static String coverPhoto = DefaultPersonalImage.urlCoverPhoto;
  static String username = "username";
  static String bio = "welcome to my profile";

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    coverPhoto = json['coverPhoto'];
    username = json['username'];
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
  CurrentUserData.takeBio(String newBio) {
    bio = newBio;
  }
}
