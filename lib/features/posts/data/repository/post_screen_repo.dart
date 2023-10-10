import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PostScreenRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData({
    required String currentUserUid,
  });
  Future createNewPost({
    required String description,
    required String postStatus,
  });
}
