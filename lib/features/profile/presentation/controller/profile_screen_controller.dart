import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../posts/data/model/post_model.dart';
import '../../data/models/profile_model.dart';
import '../../data/repository/api/profile_screen_api.dart';

Stream<DocumentSnapshot<Map<String, dynamic>>> getDataToProfileScreen({
  required String otherUid,
}) {
  return ProfileScreenApi().getDataToProfileScreen(otherUid: otherUid);
}

Future<List<PostModel>> getPostsForSpecificPerson({
  required String otherUid,
}) {
  return ProfileScreenApi().getPostsForSpecificPerson(otherUid: otherUid);
}

Future<void> tapFolow({required ProfileScreenModel userData}) async {
  ProfileScreenApi().tapFolow(userData: userData);
}

Future<void> tapUnfolow({required ProfileScreenModel userData}) async {
  ProfileScreenApi().tapUnfolow(userData: userData);
}
