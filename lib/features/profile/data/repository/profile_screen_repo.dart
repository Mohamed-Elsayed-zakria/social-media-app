import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../posts/data/model/post_model.dart';
import '../models/profile_model.dart';

abstract class ProfileScreenRepo {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getDataToProfileScreen({
    required String otherUid,
  });
  Future<List<PostModel>> getPostsForSpecificPerson({
    required String otherUid,
  });

  Future<void> tapFolow({required ProfileScreenModel userData});

  Future<void> tapUnfolow({required ProfileScreenModel userData});
}
