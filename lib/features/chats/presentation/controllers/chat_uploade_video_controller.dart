import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

RxBool chatVideoIsShowIcon = false.obs;
RxBool chatVideoIsPlaying = false.obs;

void chatShowVideoPlayAndPauseVideo({
  required VideoPlayerController playerControllerPlay,
}) {
  if (playerControllerPlay.value.isPlaying) {
    playerControllerPlay.pause();
    chatVideoIsPlaying.value = true;
    chatVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => chatVideoIsShowIcon.value = false,
    );
  } else {
    playerControllerPlay.play();
    chatVideoIsPlaying.value = false;
    chatVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => chatVideoIsShowIcon.value = false,
    );
  }
}
