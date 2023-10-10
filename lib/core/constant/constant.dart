import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../api/api_service.dart';

abstract class Constant {
  static sizeScreen({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }

  static String convertDateTime({required String historyAsText}) {
    final DateTime dateTime = DateTime.parse(historyAsText);
    final DateTime now = DateTime.timestamp();
    final Duration difference = now.difference(dateTime);
    if (difference.inSeconds < 3) {
      return 'Now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else {
      return DateFormat('MMMM d, ' 'y').format(dateTime);
    }
  }

  static const String userCollection = 'users';

  static const String postCollection = 'posts';

  static const String storyCollection = 'story';

  static const String commentsCollection = 'comments';

  static const String likesCollection = 'likes';

  static const String messageCollection = 'message';

  static const String chatCollection = 'chat';

  static const String notificationCollection = 'notification';

  static const String verificationCollection = 'verification';

  static const String reportPostCollection = 'Report post';

  static const String reportProblemCollection = 'Report problem';

  static String postImagesPath({
    required String generatId,
  }) =>
      'post-images/$generatId/${DateTime.timestamp().millisecondsSinceEpoch}.jpg';

  static String userImagesPath =
      "user-images/${ApiService.user.uid}/profile-image/${DateTime.timestamp().millisecondsSinceEpoch}.jpg";

  static String userPersonalPictureVerificationPath =
      "user-Verification/${ApiService.user.uid}/personal-picture/${DateTime.timestamp().millisecondsSinceEpoch}.jpg";
  static String userImageIdVerificationPath =
      "user-Verification/${ApiService.user.uid}/id-picture/${DateTime.timestamp().millisecondsSinceEpoch}.jpg";
  static String userImagesStoryPath({
    required String generatStoryId,
  }) =>
      "user-images-story/${ApiService.user.uid}/$generatStoryId/${DateTime.timestamp().millisecondsSinceEpoch}.jpg";

  static const String urlCoverPhoto =
      "https://firebasestorage.googleapis.com/v0/b/social-frinds.appspot.com/o/defulte-cover%2Fcover.jpg?alt=media&token=cfed2d09-7e9b-4f9f-855f-ec0df1344d71";

  static const String urlPhotoFemale =
      "https://firebasestorage.googleapis.com/v0/b/social-frinds.appspot.com/o/default-profile-pictures%2Ffemale.png?alt=media&token=f3057105-d842-41eb-af94-40044c83ed66";

  static const String urlPhotoMale =
      "https://firebasestorage.googleapis.com/v0/b/social-frinds.appspot.com/o/default-profile-pictures%2Fmale.png?alt=media&token=9785f3a6-61d8-4a6c-9079-5effbe0eff8a";
}
