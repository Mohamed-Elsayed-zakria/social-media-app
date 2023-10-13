import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/constant/colors.dart';
import '../../../presentation/controllers/edite_personal_controller.dart';
import '../edite_personal_repo.dart';

class EditePersonalApi extends EditePersonalRepo {
  @override
  Future<bool> isUsernameTaken({required String username}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<void> updateUserData({
    required String username,
    required String firstname,
    required String lastname,
    required String? dateTime,
  }) async {
    if (username.isNotEmpty) {
      if (await isUsernameTaken(username: username)) {
        editePersonUpdateUserData.value = false;
        Get.snackbar(
          "Error".tr,
          "username already taken".tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      } else {
        editePersonUpdateUserData.value = true;

        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({'username': username});
        editePersonGetUsername.clear();
        editePersonUpdateUserData.value = false;
        Fluttertoast.showToast(
          msg: "Done".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }

    if (firstname.isNotEmpty) {
      try {
        editePersonUpdateUserData.value = true;

        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({'firstName': firstname});

        editePersonGetFirstName.clear();
        editePersonUpdateUserData.value = false;
        Fluttertoast.showToast(
          msg: "Done".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } catch (e) {
        editePersonUpdateUserData.value = false;
      }
    }

    if (lastname.isNotEmpty) {
      try {
        editePersonUpdateUserData.value = true;
        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({'lastName': lastname});
        editePersonGetLastName.clear();
        editePersonUpdateUserData.value = false;
        Fluttertoast.showToast(
          msg: "Done".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } catch (e) {
        editePersonUpdateUserData.value = false;
      }
    }
    if (dateTime != "null") {
      try {
        editePersonUpdateUserData.value = true;
        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({'age': dateTime});
        editePersonUpdateUserData.value = false;
        editePersonDateOfBirth.value = null;
        Fluttertoast.showToast(
          msg: "Done".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } catch (e) {
        editePersonUpdateUserData.value = false;
      }
    }
  }
}
