import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repository/api/all_likes_api.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getPersonWordLikeByUid({
  required String getLikesByUid,
}) {
  return AllLikesApi().getPersonWordLikeByUid(getLikesByUid: getLikesByUid);
}
