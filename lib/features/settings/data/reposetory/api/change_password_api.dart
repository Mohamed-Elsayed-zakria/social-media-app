import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../../../presentation/controllers/change_password_controller.dart';
import '../../../presentation/views/account_settings_screen.dart';
import '../change_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        Get.snackbar(
          "Done".tr,
          "Verification link has been sent email".tr,
          backgroundColor: AppColors.kSecondeColor,
          colorText: AppColors.kSurfaceColor,
        );
        changePasswordGetPassword.clear();
        Get.off(() => const AccountSettingsScreen());
      });
    } on FirebaseAuthException catch (e) {
      changePasswordIsLodinge.value = false;
      if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error".tr,
          "Wrong password provided for that user".tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      }
    }
  }
}
