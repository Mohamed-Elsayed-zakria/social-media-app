import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../presentation/controllers/login_screen_controller.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update(loginScreenModel.toJson());
        DocumentSnapshot<Map<String, dynamic>> currentUserData =
            await ApiService.firestore
                .collection(Collections.userCollection)
                .doc(ApiService.user.uid)
                .get();
        CurrentUserData.fromJson(currentUserData.data()!);
        loginIsLodinge.value = false;
        Get.offAll(() => const MainHomeScreen());
        loginGetEmail.clear();
        loginGetPassword.clear();
      });
    } on FirebaseAuthException catch (e) {
      loginIsLodinge.value = false;
      if (e.code == 'user-not-found') {
        snackBar(
          message: 'No user found for that email.'.tr,
          isError: true,
        );
      } else if (e.code == 'wrong-password') {
        snackBar(
          message: 'Wrong password provided for that user.'.tr,
          isError: true,
        );
      }
    }
  }
}
