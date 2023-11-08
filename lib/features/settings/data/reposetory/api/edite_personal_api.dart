import '../../../presentation/controllers/edite_personal_controller.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../edite_personal_repo.dart';
import 'package:get/get.dart';

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
      if (CurrentUserData.verified == false) {
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
              .update({'username': username}).then((value) {
            editePersonGetUsername.clear();
            CurrentUserData.takeUsername(username);
            editePersonUpdateUserData.value = false;
            showToast(msg: "Done".tr);
          });
        }
      } else {
        Get.snackbar(
          'Error'.tr,
          'Cannot change username'.tr,
          backgroundColor: AppColors.kErrorColor,
          colorText: AppColors.kSurfaceColor,
        );
      }
    }

    if (firstname.isNotEmpty) {
      try {
        editePersonUpdateUserData.value = true;

        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({'firstName': firstname}).then((value) {
          editePersonGetFirstName.clear();
          editePersonUpdateUserData.value = false;
          showToast(msg: "Done".tr);
        });
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
            .update({'lastName': lastname}).then((value) {
          editePersonGetLastName.clear();
          editePersonUpdateUserData.value = false;
          showToast(msg: "Done".tr);
        });
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
            .update({'age': dateTime}).then((value) {
          editePersonUpdateUserData.value = false;
          editePersonDateOfBirth.value = null;
          showToast(msg: "Done".tr);
        });
      } catch (e) {
        editePersonUpdateUserData.value = false;
      }
    }
  }
}
