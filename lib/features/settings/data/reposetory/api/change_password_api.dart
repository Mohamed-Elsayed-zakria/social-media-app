import '../../../presentation/controllers/change_password_controller.dart';
import '../../../presentation/views/account_settings_screen.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../change_password_repo.dart';
import 'package:get/get.dart';

class ChangePasswordApi extends ChangePasswordRepo {
  @override
  Future<void> changePassword({required String oldPassword}) async {
    try {
      changePasswordIsLodinge.value = true;
      await ApiService.auth
          .signInWithEmailAndPassword(
        email: ApiService.user.email!,
        password: oldPassword,
      )
          .then((value) {
        ApiService.auth.sendPasswordResetEmail(email: ApiService.user.email!);
        changePasswordIsLodinge.value = true;
        snackBar(
          message: "Verification link has been sent email".tr,
          isError: false,
        );
        changePasswordGetPassword.clear();
        Get.off(() => const AccountSettingsScreen());
      });
    } on FirebaseAuthException catch (e) {
      changePasswordIsLodinge.value = false;
      if (e.code == 'wrong-password') {
        snackBar(
          message: "Wrong password provided for that user".tr,
          isError: true,
        );
      }
    }
  }
}
