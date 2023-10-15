import '../../data/repository/api/profile_screen_api.dart';
import '../../../posts/data/model/post_model.dart';
import '../../data/models/profile_model.dart';

Stream<Map<String, dynamic>> getCurrentUserData({
  required String otherUid,
}) {
  return ProfileScreenApi().getCurrentUserData(otherUid: otherUid);
}

Future<void> tapFolow({required ProfileScreenModel userData}) async {
  ProfileScreenApi().tapFolow(userData: userData);
}

Future<void> tapUnfolow({required ProfileScreenModel userData}) async {
  ProfileScreenApi().tapUnfolow(userData: userData);
}

Future<List<PostModel>> getPostsForSpecificPerson({
  required String otherUid,
}) {
  return ProfileScreenApi().getPostsForSpecificPerson(otherUid: otherUid);
}
