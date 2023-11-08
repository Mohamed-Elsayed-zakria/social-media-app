import '../../../posts/data/model/post_model.dart';
import '../models/profile_model.dart';

abstract class ProfileScreenRepo {
  Future<Map<String, dynamic>> getCurrentUserData({required String otherUid});

  Future<void> tapFolow({required ProfileScreenModel userData});

  Future<void> tapUnfolow({required ProfileScreenModel userData});

  Future<List<PostModel>> getPostsForSpecificPerson({
    required String otherUid,
  });
}
