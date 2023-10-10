import '../../data/repository/api/login_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController loginGetEmail = TextEditingController();
final TextEditingController loginGetPassword = TextEditingController();
final GlobalKey<FormState> formKeyLogin = GlobalKey();

RxBool loginIsLodinge = false.obs;

class LoginController extends GetxController {
  bool loginHindTextPassword = true;

  void loginChangeHindText() {
    loginHindTextPassword = !loginHindTextPassword;
    update();
  }
}

String? loginvalidatorEmail({required String? value}) {
  if (value!.isEmpty) {
    return "Email field empty".tr;
  } else if (!GetUtils.isEmail(value)) {
    return "Valid email".tr;
  } else {
    return null;
  }
}

String? loginvalidatorpassword({required String? value}) {
  if (value!.isEmpty) {
    return "Password field empty".tr;
  } else {
    return null;
  }
}

Future<void> loginWithAccuont({
  required String emailAddress,
  required String password,
}) async {
  LoginScreenApi().loginWithAccuont(
    emailAddress: emailAddress,
    password: password,
  );
}
