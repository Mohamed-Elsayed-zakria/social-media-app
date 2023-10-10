import '../../data/reposetory/api/change_password_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


RxBool changePasswordIsLodinge = false.obs;

GlobalKey<FormState> formKeyChangePassword = GlobalKey();

final TextEditingController changePasswordGetPassword = TextEditingController();

class ChangePasswordController extends GetxController {
  RxBool hindText = true.obs;

  void changeHindText() {
    hindText.value = !hindText.value;
  }

  Future<void> changePassword({required String oldPassword}) async {
    ChangePasswordApi().changePassword(oldPassword: oldPassword);
  }
}
