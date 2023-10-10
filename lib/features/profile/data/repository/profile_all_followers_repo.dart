import '../models/profile_model.dart';

abstract class ProfileAllFollowersRepo {
  Future<List<ProfileScreenModel>> getFollowerByUID({required String otherUid});

  Future<List<ProfileScreenModel>> getFollowingByUID({
    required String otherUid,
  });
}
