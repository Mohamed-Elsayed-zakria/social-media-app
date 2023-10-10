import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/constant.dart';
import '../../../presentation/controllers/verification_controller.dart';
import '../../models/verification_model.dart';
import '../verification_repo.dart';
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
        final storageRefImgPathPick = ApiService.fireStorage.ref(
          Constant.userPersonalPictureVerificationPath,
        );
        await storageRefImgPathPick.putFile(imgPathPick.value!);

        imgPathPickUrl = await storageRefImgPathPick.getDownloadURL();
      }
    } catch (e) {
      verificationScreenLoding.value = false;
    }

    try {
      if (imgPathId.value != null) {
        final storageRefImgPathId = ApiService.fireStorage.ref(
          Constant.userImageIdVerificationPath,
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
          .collection(Constant.verificationCollection)
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
