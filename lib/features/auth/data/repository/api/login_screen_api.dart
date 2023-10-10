import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../presentation/controllers/login_screen_controller.dart';
import '../../../../../core/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/api/api_service.dart';
import '../../models/login_screen_model.dart';
import '../login_screen_repo.dart';
import 'package:get/get.dart';

class LoginScreenApi extends LoginScreenRepo {
  @override
  Future<void> loginWithAccuont({
    required String emailAddress,
    required String password,
  }) async {
    try {
      loginIsLodinge.value = true;
      String? myToken = await ApiFirebaseMessaging.getToken();

      LoginScreenModel loginScreenModel = LoginScreenModel(token: myToken);

      await ApiService.auth
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) async {
        await ApiService.firestore
            .collection(Constant.userCollection)
            .doc(ApiService.user.uid)
            .update(loginScreenModel.toJson());
        loginIsLodinge.value = false;
        Get.offAll(() => const MainHomeScreen());
        loginGetEmail.clear();
        loginGetPassword.clear();
      });
    } on FirebaseAuthException catch (e) {
      loginIsLodinge.value = false;
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error'.tr,
          'No user found for that email.'.tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error'.tr,
          'Wrong password provided for that user.'.tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      }
    }
  }
}
