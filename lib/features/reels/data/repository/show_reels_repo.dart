import '../model/video_reels_model.dart';

abstract class ShowReelsRepo {
  Future<List<VideoReelsModel>> getAllReels();
  Stream<List> getReelsLikes({required String videoUid});
  Future<void> addLikeToReels({required String videoUid});
  Future<void> removeLikeToReels({required String videoUid});
}
