import '../../data/repository/api/all_likes_api.dart';
import '../../data/model/likes_model.dart';

Future<List<LikesModel>> getAllLikesByUid({required String postUid}) {
  return AllLikesApi().getAllLikesByUid(postUid: postUid);
}
