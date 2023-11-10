import '../../../presentation/controllers/forgot_password_screen_controller.dart';
import '../../../../../core/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        snackBar(
          message: "Verification link has been sent email".tr,
          isError: false,
        );
      });
    } on FirebaseAuthException catch (e) {
      forgotPasswordIsLodinge.value = false;
      if (e.code == 'user-not-found') {
        snackBar(message: 'No user found for that email.'.tr, isError: true);
      } else {
        snackBar(message: "$e".tr, isError: true);
      }
    }
  }
}
