import '../../../presentation/controllers/forgot_password_screen_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/api/api_service.dart';
import '../forgot_password_screen.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenApi extends ForgotPasswordScreenRepo {
  @override
  Future<void> forgotPassword({required String text}) async {
    forgotPasswordIsLodinge.value = true;
    try {
      await ApiService.auth.sendPasswordResetEmail(email: text).then((value) {
        forgotPasswordIsLodinge.value = false;
        Get.back();
        Get.snackbar(
          "Done".tr,
          "Verification link has been sent email".tr,
          backgroundColor: AppColors.kSecondeColor,
          colorText: AppColors.kSurfaceColor,
        );
      });
    } on FirebaseAuthException catch (e) {
      forgotPasswordIsLodinge.value = false;
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error'.tr,
          'No user found for that email.'.tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      } else {
        Get.snackbar(
          "Error".tr,
          "$e",
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      }
    }
  }
}
