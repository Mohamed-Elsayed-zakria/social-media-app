import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AllLikesRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getPersonWordLikeByUid({
    required String getLikesByUid,
  });
}
