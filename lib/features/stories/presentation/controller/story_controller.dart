import '../../../../core/utils/size_screen.dart';
import '../../data/model/stories_model.dart';
import '../../data/repository/story_screen_api.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import '../view/uploade_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

RxBool uploadeStoryIsLoading = false.obs;

late VideoPlayerController? playerController;

PageController pageController = PageController();

File? vedioPath;

Future<void> uploadeStory({
  required String type,
  String? description,
  String? imgPath,
  File? vedioPath,
}) async {
  StoryScreenApi().uploadeStory(
    imgPath: imgPath,
    description: description,
    vedioPath: vedioPath,
    type: type,
  );
}

Future<void> imageStoryOpenGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    Get.to(
      () => UploadeStoryScreen(
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
    vedioPath = videoFile;
    playerController = VideoPlayerController.file(vedioPath!);
    await playerController!.initialize();
    playerController!.play();
    Get.to(
      () => UploadeStoryScreen(
        playerControllerPlay: playerController,
        type: TypeStoryUploade.vedio,
      ),
    );
  }
}

void pressOnTheScreen({
  required TapDownDetails details,
  required BuildContext context,
}) {
  final screenWidth = sizeScreen(context: context).width;
  double tapPositionX = details.localPosition.dx;

  if (tapPositionX < screenWidth / 2) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  } else {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
