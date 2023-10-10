import '../../data/models/profile_model.dart';
import '../../data/repository/api/profile_all_followers_api.dart';

Future<List<ProfileScreenModel>> getFollowerByUID({required String otherUid}) {
  return ProfileAllFollowersApi().getFollowerByUID(otherUid: otherUid);
}

Future<List<ProfileScreenModel>> getFollowingByUID({required String otherUid}) {
  return ProfileAllFollowersApi().getFollowingByUID(otherUid: otherUid);
}
