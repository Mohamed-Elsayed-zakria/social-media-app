import '../../data/repository/api/profile_edite_api.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

Rx<File?> updateImgPathPicture = Rx<File?>(null);
Rx<File?> updateImgPathCover = Rx<File?>(null);

Rx<File?> imgPathPictureLoding = Rx<File?>(null);
Rx<File?> imgPathCoverLoding = Rx<File?>(null);

RxBool updateIsLodinge = false.obs;

final TextEditingController getTextBio = TextEditingController();

final GlobalKey<FormState> profileKeyLogin = GlobalKey();

String? profilevalidatorBio({required String? value}) {
  if (value!.isEmpty) {
    return "bio field empty".tr;
  } else {
    return null;
  }
}

Future<void> chooseImagePictureFromGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImg.path,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edite'.tr,
          toolbarColor: AppColors.kPrimaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );

    if (croppedFile != null) {
      updateImgPathPicture.value = File(croppedFile.path);
      imgPathPictureLoding.value = File(croppedFile.path);
    }
  }
}

Future<void> chooseImageCoverFromGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImg.path,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edite'.tr,
          toolbarColor: AppColors.kPrimaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          activeControlsWidgetColor: AppColors.kPrimaryColor,
        ),
      ],
    );

    if (croppedFile != null) {
      updateImgPathCover.value = File(croppedFile.path);
      imgPathCoverLoding.value = File(croppedFile.path);
    }
  }
}

Future<void> uploadImagePicture() async {
  ProfileEditeApi().uploadImagePicture();
}

Future<void> uploadImageCover() async {
  ProfileEditeApi().uploadImageCover();
}

class ProfileEditeController extends GetxController {
  Future<void> updateBio({required String text}) async {
    await ProfileEditeApi().updateBio(text: text);
    update();
  }
}
