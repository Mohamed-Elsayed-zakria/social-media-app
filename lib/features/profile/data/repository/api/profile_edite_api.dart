import '../../../presentation/controller/profile_edite_controller.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../profile_edite_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class ProfileEditeApi extends ProfileEditeRepo {
  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileEdite() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .snapshots();
  }

  @override
  Future<void> updateBio({required String text}) async {
    try {
      updateIsLodinge.value = true;
      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .update({'bio': text});
      getTextBio.clear();
      updateIsLodinge.value = false;
    } catch (e) {
      updateIsLodinge.value = false;
    }
  }

  @override
  Future<void> uploadImagePicture() async {
    try {
      if (imgPathPicture.value != null) {
        updateIsLodinge.value = true;
        String generatPersonalImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/personal-image/$generatPersonalImageId.jpg",
        );
        await storageRef.putFile(imgPathPicture.value!);

        String url = await storageRef.getDownloadURL();

        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({
          'personalPicture': url,
        });
        imgPathPicture.value = null;
        updateIsLodinge.value = false;
      }
    } catch (e) {
      updateIsLodinge.value = false;
      Get.snackbar(
        "Error".tr,
        "$e",
        backgroundColor: AppColors.kErrorColor,
        colorText: AppColors.kSurfaceColor,
      );
    }
  }

  @override
  Future<void> uploadImageCover() async {
    try {
      if (imgPathCover.value != null) {
        updateIsLodinge.value = true;
        String generatCoverImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/personal-image/$generatCoverImageId.jpg",
        );
        await storageRef.putFile(imgPathCover.value!);

        String url = await storageRef.getDownloadURL();
        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({
          'coverPhoto': url,
        });
        imgPathCover.value = null;
        updateIsLodinge.value = false;
      }
    } catch (e) {
      updateIsLodinge.value = false;
      Get.snackbar(
        "Error".tr,
        "$e",
        backgroundColor: AppColors.kErrorColor,
        colorText: AppColors.kSurfaceColor,
      );
    }
  }
}
