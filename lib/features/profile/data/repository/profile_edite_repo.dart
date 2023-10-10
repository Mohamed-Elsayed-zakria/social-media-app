import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileEditeRepo {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileEdite();
  Future<void> uploadImagePicture();
  Future<void> uploadImageCover();
  Future<void> updateBio({required String text});
}
