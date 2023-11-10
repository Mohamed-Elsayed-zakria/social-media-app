import '../../data/repository/api/uploade_reels_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/utils/snack_bar.dart';
import '../views/uploade_reels_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

TextEditingController? getDescriptionReels = TextEditingController();

VideoPlayerController? addVideoReelsController;
File? addVideoReelsPath;

RxString uploadeReelsSelectItem = ''.obs;

RxBool uploadeReelsIsLoading = false.obs;
RxBool isPlaying = false.obs;
RxBool isShow = false.obs;


Future<void> addVideoReelsOpenGalary() async {
  final pickedVideo = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );

  if (pickedVideo != null) {
    final videoFile = File(pickedVideo.path);
    final videoSize = await videoFile.length();

    final double videoSizeInMB = videoSize / (1024 * 1024);
    if (videoSizeInMB > 30) {
      snackBar(
        message: "The allowed video size is 30 MB".tr,
        isError: true,
      );
      return;
    }
    addVideoReelsPath = videoFile;
    addVideoReelsController = VideoPlayerController.file(addVideoReelsPath!);
    if (addVideoReelsController != null) {
      await addVideoReelsController!.initialize();
      addVideoReelsController!.play();
      Get.to(
        () => UploadeReelsScreen(
          playerControllerPlay: addVideoReelsController!,
        ),
      );
    }
  }
}

void playAndPauseVideo({required VideoPlayerController playerControllerPlay}) {
  if (playerControllerPlay.value.isPlaying) {
    playerControllerPlay.pause();
    isPlaying.value = true;
    isShow.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => isShow.value = false,
    );
  } else {
    playerControllerPlay.play();
    isPlaying.value = false;
    isShow.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => isShow.value = false,
    );
  }
}

Future<void> uploadeVideoReels({
  required String postStatus,
  String? description,
}) async {
  UploadeReelsApi().uploadeVideoReels(
    postStatus: postStatus,
    description: description,
  );
}
