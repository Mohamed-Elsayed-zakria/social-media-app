import '../constant/constant.dart';

class CurrentUserData {
  static String personalPicture = Constant.urlPhotoMale;
  static String username = "username";

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    username = json['username'];
  }
}
