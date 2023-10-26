import '../../../auth/presentation/views/login_screen.dart';
import '../../data/reposetory/api/settings_screen_api.dart';
import 'package:get/get.dart';

Future<void> exitFromApp() async {
  SettingsScreenApi().exitFromApp();
  Get.offAll(() => const LoginScreen());
}
