import '../../data/repository/story_screen_api.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../data/model/stories_model.dart';
import '../view/uploade_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

VideoPlayerController? addNewStoryPlayerController;

PageController pageController = PageController();

RxBool uploadeStoryIsLoading = false.obs;

File? addNewStoryVedioPath;

int selectColorIndex = 0;

class UploadeStoryController extends GetxController {
  List<Color> storyColors = [
    AppColors.kPrimaryColor,
    Colors.teal,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.blueGrey,
  ];
  increaseCounter() {
    if (selectColorIndex < storyColors.length - 1) {
      selectColorIndex++;
      update();
    } else {
      selectColorIndex = 0;
      update();
    }
  }
}

Future<void> uploadeStory({
  required int durationTime,
  required String type,
  String? description,
  String? imgPath,
  String? color,
}) async {
  StoryScreenApi().uploadeStory(
    durationTime: durationTime,
    description: description,
    imgPath: imgPath,
    color: color,
    type: type,
  );
}

Future<void> deleteStory({required String storyUid}) async {
  StoryScreenApi().deleteStory(storyUid: storyUid);
}

Future<void> reportStory({required StoriesModel storyData}) async {
  StoryScreenApi().reportStory(storyData: storyData);
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
    if (videoSizeInMB > 20) {
      snackBar(
        message: "The allowed video size is 20 MB".tr,
        isError: true,
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
