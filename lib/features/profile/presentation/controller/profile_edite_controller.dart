import '../../data/repository/api/profile_edite_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

Rx<File?> imgPathPicture = Rx<File?>(null);
Rx<File?> imgPathCover = Rx<File?>(null);

RxBool pictureUpdateIsLodinge = false.obs;
RxBool coverUpdateIsLodinge = false.obs;

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

Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileEdite() {
  return ProfileEditeApi().getUserDataProfileEdite();
}

Future<void> chooseImagePictureFromGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    imgPathPicture.value = File(pickedImg.path);
  }
}

Future<void> chooseImageCoverFromGalary() async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    imgPathCover.value = File(pickedImg.path);
  }
}

Future<void> uploadImagePicture() async {
  ProfileEditeApi().uploadImagePicture();
}

Future<void> uploadImageCover() async {
  ProfileEditeApi().uploadImageCover();
}

Future<void> updateBio({required String text}) async {
  ProfileEditeApi().updateBio(text: text);
}
