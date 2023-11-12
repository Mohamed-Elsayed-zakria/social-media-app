import '../../data/repository/api/show_reels_api.dart';
import '../../data/model/reels_model.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'dart:async';

RxBool showVideoIsPlaying = false.obs;
RxBool showVideoIsShowIcon = false.obs;

void showVideoPlayAndPauseVideo({
  required VideoPlayerController playerControllerPlay,
}) {
  if (playerControllerPlay.value.isPlaying) {
    playerControllerPlay.pause();
    showVideoIsPlaying.value = true;
    showVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => showVideoIsShowIcon.value = false,
    );
  } else {
    playerControllerPlay.play();
    showVideoIsPlaying.value = false;
    showVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => showVideoIsShowIcon.value = false,
    );
  }
}

Future<List<ReelsModel>> getAllReels() async {
  return ShowReelsApi().getAllReels();
}

Stream<List> getReelsLikes({required String reelsUid}) {
  return ShowReelsApi().getReelsLikes(reelsUid: reelsUid);
}

Stream<int> getCommentReelsCount({required String reelsUid}) {
  return ShowReelsApi().getCommentReelsCount(reelsUid: reelsUid);
}

Future<void> addLikeToReels({required String reelsUid}) async {
  ShowReelsApi().addLikeToReels(reelsUid: reelsUid);
}

Future<void> removeLikeToReels({required String reelsUid}) async {
  ShowReelsApi().removeLikeToReels(reelsUid: reelsUid);
}

Future<void> reportReels({required ReelsModel reelsModel}) async {
  ShowReelsApi().reportReels(reelsModel: reelsModel);
}

Future<void> deleteReels({required String reelsUid}) async {
  ShowReelsApi().deleteReels(reelsUid: reelsUid);
}
