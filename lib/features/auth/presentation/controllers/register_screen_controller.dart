import 'package:flash/features/auth/data/repository/api/register_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController registerGetEmail = TextEditingController();
final TextEditingController registerGetPassword = TextEditingController();
final TextEditingController registerGetRetypePassword = TextEditingController();

final GlobalKey<FormState> formKeyRegister = GlobalKey();

RxBool registerIsLodinge = false.obs;

RxBool iAgreeToUseUsagePolicy = false.obs;

RxBool validatorCheckbox = false.obs;

class RegisterController extends GetxController {
  bool registerHintTextPassword = true;
  bool registerHintTextRePassword = true;
  void registerChangeHindTextPassword() {
    registerHintTextPassword = !registerHintTextPassword;
    update();
  }

  void registerChangeHindTextRePassword() {
    registerHintTextRePassword = !registerHintTextRePassword;
    update();
  }
}

String? registervalidatorEmail({required String? value}) {
  if (value!.isEmpty) {
    return "Email field empty".tr;
  } else if (!GetUtils.isEmail(value)) {
    return "Valid email".tr;
  } else {
    return null;
  }
}

String? registervalidatorpassword({required String? value}) {
  if (value!.isEmpty) {
    return "Password field empty".tr;
  } else if (value.length < 8) {
    return 'Password must be greater than or equal to 8 characters';
  } else {
    return null;
  }
}

String? registervalidatorConfirmPassword({required String? value}) {
  if (value!.isEmpty) {
    return "Confirm password Field Empty".tr;
  } else if (registerGetPassword.text != registerGetRetypePassword.text) {
    return "Password does not match".tr;
  } else {
    return null;
  }
}

Future<void> createNewAccount({
  required String emailAddress,
  required String password,
}) async {
  RegisterScreenApi().createNewAccount(
    emailAddress: emailAddress,
    password: password,
  );
}
