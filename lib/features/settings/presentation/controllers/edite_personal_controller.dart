import '../../data/reposetory/api/edite_personal_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextEditingController editePersonGetUsername = TextEditingController();
final TextEditingController editePersonGetFirstName = TextEditingController();
final TextEditingController editePersonGetLastName = TextEditingController();
final GlobalKey<FormState> formKeyeditePerson = GlobalKey();

final RegExp validCharacters = RegExp(r'^[a-z0-9_]+$');

DateTime editePersonDateNow = DateTime.timestamp();
DateTime editePersonInitialDate = editePersonDateNow.subtract(
  const Duration(days: 365 * 10),
);
DateTime editePersonFirstDate = editePersonDateNow.subtract(
  const Duration(days: 365 * 100),
);
Rx<DateTime?> editePersonDateOfBirth = Rx<DateTime?>(null);

RxBool editePersonValidatorAge = true.obs;
RxBool editePersonValidatorGender = true.obs;

RxString editePersonGender = 'Gender'.obs;

RxBool editePersonUpdateUserData = false.obs;

String? editePersonValidatorUsername({required String? value}) {
  if (value!.isNotEmpty) {
    if (value.length < 3) {
      return "username is too short".tr;
    } else if (value.contains(" ")) {
      return "username cannot contain spaces".tr;
    } else if (!validCharacters.hasMatch(value)) {
      return "username can contain only ( abc , 123 , _ )".tr;
    } else {
      return null;
    }
  }
  return null;
}

String? editePersonvalidatorFirstname({required String? value}) {
  if (value!.isNotEmpty) {
    if (value.length < 3) {
      return "Firstname is too short".tr;
    } else {
      return null;
    }
  }
  return null;
}

String? editePersonvalidatorLastname({required String? value}) {
  if (value!.isNotEmpty) {
    if (value.length < 3) {
      return "Lastname is too short".tr;
    } else {
      return null;
    }
  }
  return null;
}

Future<bool> isUsernameTaken({required String username}) async {
  return EditePersonalApi().isUsernameTaken(username: username);
}

Future<void> updateUserData({
  required String username,
  required String firstname,
  required String lastname,
  required String dateTime,
}) async {
  EditePersonalApi().updateUserData(
    username: username,
    firstname: firstname,
    lastname: lastname,
    dateTime: dateTime,
  );
}
