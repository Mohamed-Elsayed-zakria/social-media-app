import '../model/likes_model.dart';

abstract class AllLikesRepo {
  Future<List<LikesModel>> getAllLikesByUid({required String postUid});
}
