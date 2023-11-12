import '../model/reels_model.dart';

abstract class ShowReelsRepo {
  Future<List<ReelsModel>> getAllReels();
  Stream<List> getReelsLikes({required String reelsUid});
  Stream<int> getCommentReelsCount({required String reelsUid});
  Future<void> addLikeToReels({required String reelsUid});
  Future<void> removeLikeToReels({required String reelsUid});
Future<void> reportReels({required ReelsModel reelsModel});
  Future<void> deleteReels({required String reelsUid});
}
