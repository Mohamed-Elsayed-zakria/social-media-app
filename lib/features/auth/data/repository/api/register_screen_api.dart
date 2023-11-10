import '../../../presentation/controllers/register_screen_controller.dart';
import '../../../presentation/views/add_details_screen.dart';
import '../../../../../core/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/api/api_service.dart';
import '../register_screen_repo.dart';
import 'package:get/get.dart';

class RegisterScreenApi extends RegisterScreenRepo {
  @override
  Future<void> createNewAccount({
    required String emailAddress,
    required String password,
  }) async {
    try {
      registerIsLodinge.value = true;
      await ApiService.auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        registerGetEmail.clear();
        registerGetPassword.clear();
        registerGetRetypePassword.clear();
        registerIsLodinge.value = false;
        Get.offAll(() => const AddDetailsScreen());
      });
    } on FirebaseAuthException catch (e) {
      registerIsLodinge.value = false;
      if (e.code == 'email-already-in-use') {
        snackBar(
          message: 'The account already exists for that email.'.tr,
          isError: true,
        );
      }
    } catch (e) {
      snackBar(
        message: '$e.'.tr,
        isError: true,
      );
    }
  }
}
