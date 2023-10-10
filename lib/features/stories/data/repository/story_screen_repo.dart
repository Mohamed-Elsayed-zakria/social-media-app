import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/stories_model.dart';
import 'dart:io';

abstract class StoryScreenRepo {
  Future<void> uploadeStory({
    required TypeStoryUploade type,
    String? description,
    String? imgPath,
    File? vedioPath,
  });
  Future<DocumentSnapshot<Map<String, dynamic>>> getuserDataToStory({
    required String otherUid,
  });
 Future<String> getCurrentPersonalPicture();
}
