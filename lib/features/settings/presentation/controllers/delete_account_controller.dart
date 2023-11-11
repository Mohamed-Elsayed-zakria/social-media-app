import '../../data/reposetory/api/delete_account_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController deleteAccountGetPassword = TextEditingController();
GlobalKey<FormState> formKeyDeleteAccount = GlobalKey();

RxBool deleteAccountIsLodinge = false.obs;

class DeleteAccountController extends GetxController {
  RxBool hindText = false.obs;

  void changeHindText() {
    hindText.value = !hindText.value;
  }

  Future<void> deleteAccount({required String password}) async {
    DeleteAccountApi().deleteAccount(password: password);
  }
}
