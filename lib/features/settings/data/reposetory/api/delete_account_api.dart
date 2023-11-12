import '../../../presentation/controllers/delete_account_controller.dart';
import '../../../../auth/presentation/views/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/utils/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../delete_account_repo.dart';
import 'package:get/get.dart';

class DeleteAccountApi implements DeleteAccountRepo {
  @override
  Future<void> deleteAccount({required String password}) async {
    deleteAccountIsLodinge.value = true;
    try {
      await ApiService.auth
          .signInWithEmailAndPassword(
        email: ApiService.user.email!,
        password: password,
      )
          .then(
        (value) async {
          String folderPath = "user-files/${ApiService.user.uid}/";

          try {
            await ApiService.auth.currentUser!.delete();
            final userRef = ApiService.firestore
                .collection(Collections.userCollection)
                .doc(ApiService.user.uid);

            await userRef.delete();

            final subCollection1Ref =
                userRef.collection(Collections.storyCollection);

            final subCollection2Ref =
                userRef.collection(Collections.notificationCollection);

            final subCollection1Docs = await subCollection1Ref.get();

            final subCollection2Docs = await subCollection2Ref.get();

            for (final doc in subCollection1Docs.docs) {
              await doc.reference.delete();
            }

            for (final doc in subCollection2Docs.docs) {
              await doc.reference.delete();
            }

            final Reference folderRef =
                ApiService.fireStorage.ref().child(folderPath);

            final ListResult result = await folderRef.listAll();

            for (final Reference ref in result.items) {
              await ref.delete();
            }

            await ApiService.auth.signOut();
            deleteAccountIsLodinge.value = false;
            Get.offAll(() => const LoginScreen());
          } catch (e) {
            showToast(msg: 'Error'.tr);
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      deleteAccountIsLodinge.value = false;
      if (e.code == 'wrong-password') {
        snackBar(
          message: "Wrong password provided for that user".tr,
          isError: true,
        );
      }
    }
  }
}
