import '../../data/repository/api/forgot_password_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController forgotPasswordGetEmail = TextEditingController();
GlobalKey<FormState> formKeyForgotPassword = GlobalKey();

RxBool forgotPasswordIsLodinge = false.obs;

String? forgotPasswordValidatorEmail({required String? value}) {
  if (value!.isEmpty) {
    return "Email field empty".tr;
  } else if (!GetUtils.isEmail(value)) {
    return "Valid email".tr;
  } else {
    return null;
  }
}

Future<void> forgotPassword({required String text}) async {
  ForgotPasswordScreenApi().forgotPassword(text: text);
}
