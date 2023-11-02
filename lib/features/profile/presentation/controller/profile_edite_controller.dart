import '../../data/repository/api/profile_edite_api.dart';
import 'package:image_picker/image_picker.dart';
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
    updateImgPathPicture.value = File(pickedImg.path);
    imgPathPictureLoding.value = File(pickedImg.path);
  }
}

Future<void> chooseImageCoverFromGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    updateImgPathCover.value = File(pickedImg.path);
    imgPathCoverLoding.value = File(pickedImg.path);
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
