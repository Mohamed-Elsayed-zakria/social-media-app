import '../../../presentation/controllers/verification_controller.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/api/api_service.dart';
import '../../models/verification_model.dart';
import '../verification_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class VerificationApi extends VerificationRepo {
  @override
  Future<void> submitVerification({
    required String fullname,
    required String message,
  }) async {
    late String imgPathPickUrl;
    late String imgPathIdUrl;
    verificationScreenLoding.value = true;

    try {
      if (imgPathPick.value != null) {
        String generatPersonalImageVerificationId = const Uuid().v1();

        final storageRefImgPathPick = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/user-Verification/personal-picture/$generatPersonalImageVerificationId.jpg",
        );
        await storageRefImgPathPick.putFile(imgPathPick.value!);

        imgPathPickUrl = await storageRefImgPathPick.getDownloadURL();
      }
    } catch (e) {
      verificationScreenLoding.value = false;
    }

    try {
      if (imgPathId.value != null) {
        String generatIdCardVerificationId = const Uuid().v1();

        final storageRefImgPathId = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/user-Verification/id-picture/$generatIdCardVerificationId.jpg",
        );
        await storageRefImgPathId.putFile(imgPathId.value!);

        imgPathIdUrl = await storageRefImgPathId.getDownloadURL();
      }
    } catch (e) {
      verificationScreenLoding.value = false;
    }

    VerificationModel verificationModel = VerificationModel(
      fullname: fullname,
      message: message,
      personUid: ApiService.user.uid,
      idPicture: imgPathIdUrl,
      personalPicture: imgPathPickUrl,
    );
    try {
      await ApiService.firestore
          .collection(Collections.verificationCollection)
          .doc(ApiService.user.uid)
          .set(verificationModel.toJson())
          .then(
            (value) => {
              verificationScreenLoding.value = false,
              getFullName.clear(),
              getMessage.clear(),
              imgPathPick.value = null,
              imgPathId.value = null,
              Get.snackbar(
                "Done".tr,
                "The request has been sent successfully".tr,
                backgroundColor: AppColors.kSecondeColor,
                colorText: AppColors.kSurfaceColor,
              )
            },
          );
    } catch (e) {
      verificationScreenLoding.value = false;
    }
  }
}
