import '../../../auth/presentation/views/login_screen.dart';
import '../../data/reposetory/api/settings_screen_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Stream<DocumentSnapshot<Map<String, dynamic>>> getuserDataToSettings() {
  return SettingsScreenApi().getuserDataToSettings();
}

Future<void> exitFromApp() async {
  
  SettingsScreenApi().exitFromApp();

  Get.offAll(() => const LoginScreen());
}
