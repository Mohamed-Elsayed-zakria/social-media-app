import '../../data/repository/api/show_reels_api.dart';
import '../../data/model/video_reels_model.dart';
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

Future<List<VideoReelsModel>> getAllReels() async {
  return ShowReelsApi().getAllReels();
}

Stream<List> getReelsLikes({required String videoUid}) {
  return ShowReelsApi().getReelsLikes(videoUid: videoUid);
}

Future<void> addLikeToReels({required String videoUid}) async {
  ShowReelsApi().addLikeToReels(videoUid: videoUid);
}

Future<void> removeLikeToReels({required String videoUid}) async {
  ShowReelsApi().removeLikeToReels(videoUid: videoUid);
}
