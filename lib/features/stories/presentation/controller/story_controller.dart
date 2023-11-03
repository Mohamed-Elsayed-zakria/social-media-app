import '../../data/repository/story_screen_api.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import '../../data/model/stories_model.dart';
import '../view/uploade_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

PageController pageController = PageController();

RxBool uploadeStoryIsLoading = false.obs;

VideoPlayerController? addNewStoryPlayerController;
File? addNewStoryVedioPath;

Future<void> uploadeStory({
  required int durationTime,
  required String type,
  String? description,
  String? imgPath,
}) async {
  StoryScreenApi().uploadeStory(
    durationTime: durationTime,
    description: description,
    imgPath: imgPath,
    type: type,
  );
}

Future<void> imageStoryOpenGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    Get.to(
      () => UploadeStoryScreen(
        durationTime: 10,
        imagePathStory: pickedImg.path,
        type: TypeStoryUploade.image,
      ),
    );
  }
}

Future<void> videoStoryOpenGalary() async {
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
    addNewStoryVedioPath = videoFile;
    addNewStoryPlayerController = VideoPlayerController.file(
      addNewStoryVedioPath!,
    );
    await addNewStoryPlayerController!.initialize();
    Duration videoDuration = addNewStoryPlayerController!.value.duration;
    int videoDurationTime = videoDuration.inSeconds.toInt();
    addNewStoryPlayerController!.play();
    Get.to(
      () => UploadeStoryScreen(
        playerControllerPlay: addNewStoryPlayerController,
        type: TypeStoryUploade.vedio,
        durationTime: videoDurationTime,
      ),
    );
  }
}
