import '../../data/reposetory/api/verification_api.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

Rx<File?> imgPathPick = Rx<File?>(null);

Rx<File?> imgPathId = Rx<File?>(null);

RxBool verificationScreenLoding = false.obs;

TextEditingController getFullName = TextEditingController();
TextEditingController getMessage = TextEditingController();

GlobalKey<FormState> formKeyVerification = GlobalKey();

uploadImagePick() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedImg != null) {
    imgPathPick.value = File(pickedImg.path);
  }
}

uploadImageId(ImageSource source) async {
  final pickedImg = await ImagePicker().pickImage(source: source);
  if (pickedImg != null) {
    imgPathId.value = File(pickedImg.path);
  }
}

Future<void> submitVerification({
  required String fullname,
  required String message,
}) async {
  if (ApiService.user.emailVerified == false) {
    Get.snackbar(
      "Error".tr,
      "The email is not verified".tr,
      backgroundColor: AppColors.kErrorColor,
      colorText: AppColors.kSurfaceColor,
    );
    return;
  }

  if (imgPathId.value == null) {
    Get.snackbar(
      "Error".tr,
      "Id photo was not selected".tr,
      backgroundColor: AppColors.kErrorColor,
      colorText: AppColors.kSurfaceColor,
    );
  }
  if (imgPathPick.value == null) {
    Get.snackbar(
      "Error".tr,
      "Personal picture not selected".tr,
      backgroundColor: AppColors.kErrorColor,
      colorText: AppColors.kSurfaceColor,
    );
  }

  if (imgPathPick.value != null &&
      imgPathId.value != null &&
      ApiService.user.emailVerified == true) {
    VerificationApi().submitVerification(
      fullname: fullname,
      message: message,
    );
  }
}
