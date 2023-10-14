import 'package:video_player/video_player.dart';
import '../../../../core/constant/colors.dart';
import '../../data/repository/api/post_screen_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

List<String> listItem = [
  "Public".tr,
  "Followers".tr,
  "Private".tr,
];

RxString selectItem = listItem[0].obs;

RxList<String> imagePaths = <String>[].obs;

RxBool addPostLoading = false.obs;

final GlobalKey<FormState> addPostFormKey = GlobalKey();

final TextEditingController getDescriptionText = TextEditingController();

Future<void> uploadeImage() async {
  final picker = ImagePicker();
  final pickedImages = await picker.pickMultiImage();

  if (pickedImages.isNotEmpty) {
    for (var image in pickedImages) {
      addImage(image.path);
    }
  }
}

void addImage(String path) {
  imagePaths.add(path);
}

void removeImage(int index) {
  imagePaths.removeAt(index);
}

Rx<File?> vedioPath = Rx<File?>(null);

late VideoPlayerController? playerController;

Future<void> uploadeVideo() async {
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
    vedioPath.value = videoFile;
    playerController = VideoPlayerController.file(vedioPath.value!);
    await playerController!.initialize();
    playerController!.play();
  }
}

String? addNewPostvalidator({required String? value}) {
  if (value!.isEmpty) {
    return 'You must add a description to the post'.tr;
  } else {
    return null;
  }
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData({
  required String currentUserUid,
}) {
  return PostScreenApi().getUserData(currentUserUid: currentUserUid);
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
