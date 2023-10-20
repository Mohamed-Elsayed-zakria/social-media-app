import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

abstract class StoryScreenRepo {
  Future<void> uploadeStory({
    required String type,
    String? description,
    String? imgPath,
    File? vedioPath,
  });
  Future<DocumentSnapshot<Map<String, dynamic>>> getuserDataToStory({
    required String otherUid,
  });
 Future<String> getCurrentPersonalPicture();
}
