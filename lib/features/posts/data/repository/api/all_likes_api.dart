import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/constant.dart';
import '../all_likes_repo.dart';

class AllLikesApi extends AllLikesRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getPersonWordLikeByUid({
    required String getLikesByUid,
  }) {
    return ApiService.firestore
        .collection(Constant.userCollection)
        .doc(getLikesByUid)
        .get();
  }
}
