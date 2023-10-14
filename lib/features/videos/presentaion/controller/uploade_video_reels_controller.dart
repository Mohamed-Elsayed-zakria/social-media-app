import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/constant/collections.dart';
import '../../data/model/video_reels_model.dart';
import '../view/uploade_video_reels_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

late VideoPlayerController? addVideoReelsController;
TextEditingController? getDescriptionReels = TextEditingController();

List<String> listItem = [
  "Public".tr,
  "Followers".tr,
  "Private".tr,
];

RxString selectItem = listItem[0].obs;

File? addVideoReelsPath;

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
      Get.snackbar(
        "Error".tr,
        "Video is too long".tr,
        backgroundColor: AppColors.kErrorColor,
        colorText: AppColors.kSurfaceColor,
      );
      return;
    }
    addVideoReelsPath = videoFile;
    addVideoReelsController = VideoPlayerController.file(addVideoReelsPath!);
    if (addVideoReelsController != null) {
      await addVideoReelsController!.initialize();
      addVideoReelsController!.play();
      Get.to(
        () => UploadeVideoReelsScreen(
          playerControllerPlay: addVideoReelsController!,
          addVideoReelsPath: addVideoReelsPath!,
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

Future uploadeVideoReels({
  required File vedioPath,
  String? description,
}) async {
  String generatId = const Uuid().v1();
  String videoUrl;

  final storageRef = FirebaseStorage.instance.ref(
    "reels-user/${ApiService.user.uid}/reels-videos/${DateTime.timestamp().millisecondsSinceEpoch}.mp4",
  );
  await storageRef.putFile(vedioPath);
  videoUrl = await storageRef.getDownloadURL();

  VideoReelsModel videoReelsModel = VideoReelsModel(
    datePublished: DateTime.timestamp().toString(),
    personUid: ApiService.user.uid,
    description: description,
    videoUid: generatId,
    videoUrl: videoUrl,
    postStatus: 'postStatus',
    postUrl: 'postUrl',
  );

  ApiService.firestore
      .collection(Collections.reelsCollection)
      .doc(generatId)
      .set(videoReelsModel.toJson())
      .then((value) {
    getDescriptionReels?.clear();
  });
}
