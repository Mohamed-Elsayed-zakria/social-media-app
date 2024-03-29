import '../../data/repository/api/add_details_screen_api.dart';
import '../../../../core/utils/get_current_date_time.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

final TextEditingController addDetailsGetUsername = TextEditingController();
final TextEditingController addDetailsGetFirstName = TextEditingController();
final TextEditingController addDetailsGetLastName = TextEditingController();
final GlobalKey<FormState> formKeyAddDetails = GlobalKey();

final RegExp validCharacters = RegExp(r'^[a-z0-9_]+$');

DateTime dateNow = currentTimeDevice();
DateTime initialDate = dateNow.subtract(const Duration(days: 365 * 10));
DateTime firstDate = dateNow.subtract(const Duration(days: 365 * 100));

Rx<DateTime?> dateOfBirth = Rx<DateTime?>(null);

RxBool validatorAge = true.obs;
RxBool validatorGender = true.obs;

RxString gender = 'Gender'.obs;

RxBool addDetailsIsLodinge = false.obs;

File? addDetailsImgPath;
late String urlPersonalPicture;

String? addDetailsValidatorUsername({required String? value}) {
  if (value!.isEmpty) {
    return "username field empty".tr;
  } else if (value.length < 3) {
    return "username is too short".tr;
  } else if (value.contains(" ")) {
    return "username cannot contain spaces".tr;
  } else if (!validCharacters.hasMatch(value)) {
    return "username can contain only ( abc , 123 , _ )".tr;
  } else {
    return null;
  }
}

String? addDetailsvalidatorFirstname({required String? value}) {
  if (value!.isEmpty) {
    return "Firstname field empty".tr;
  } else if (value.length < 3) {
    return "Firstname is too short".tr;
  } else {
    return null;
  }
}

String? addDetailsvalidatorLastname({required String? value}) {
  if (value!.isEmpty) {
    return "Lastname field empty".tr;
  } else if (value.length < 3) {
    return "Lastname is too short".tr;
  } else {
    return null;
  }
}

void validatorAgeAndGender() {
  if (dateOfBirth.value == null) {
    validatorAge.value = false;
  } else {
    validatorAge.value = true;
  }
  if (gender.value == 'Gender'.tr) {
    validatorGender.value = false;
  } else {
    validatorGender.value = true;
  }
}

Future<void> addUserDataToDatabase({required String username}) async {
  AddDetailsScreenApi().addUserDataToDatabase(username: username);
}

class AddDetailsController extends GetxController {
  Future<void> uploadImage({required ImageSource source}) async {
    XFile? pickedImg = await ImagePicker().pickImage(source: source);

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
        addDetailsImgPath = File(croppedFile.path);
        update();
      }
    }
  }
}
