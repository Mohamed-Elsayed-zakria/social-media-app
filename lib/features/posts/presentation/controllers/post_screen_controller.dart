import '../../data/repository/api/post_screen_api.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

RxString selectItem = ''.obs;

RxList<String> imagePaths = <String>[].obs;

RxBool addPostLoading = false.obs;

final GlobalKey<FormState> addPostFormKey = GlobalKey();

final TextEditingController getDescriptionText = TextEditingController();

VideoPlayerController? addNewPostplayerController;

Rx<File?> addNewPostVedioPath = Rx<File?>(null);

Future<void> uploadeImage() async {
  final picker = ImagePicker();
  final pickedImages = await picker.pickMultiImage();

  if (pickedImages.isNotEmpty) {
    for (var image in pickedImages) {
      imagePaths.add(image.path);
    }
  }
}

void removeImage(int index) {
  imagePaths.removeAt(index);
}

Future<void> uploadeVideo() async {
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
    addNewPostVedioPath.value = videoFile;
    addNewPostplayerController = VideoPlayerController.file(
      addNewPostVedioPath.value!,
    );
    await addNewPostplayerController!.initialize();
    addNewPostplayerController!.play();
  }
}

String? addNewPostvalidator({required String? value}) {
  if (value!.isEmpty) {
    return 'You must add a description to the post'.tr;
  } else {
    return null;
  }
}

Future createNewPost({
  required String description,
  required String postStatus,
}) async {
  await PostScreenApi().createNewPost(
    postStatus: postStatus,
    description: description,
  );
}
