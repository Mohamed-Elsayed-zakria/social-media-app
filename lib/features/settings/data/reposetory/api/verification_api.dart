import '../../../presentation/controllers/verification_controller.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/utils/snack_bar.dart';
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
          "user-files/${ApiService.user.uid}/images/user-Verification/personal-picture/$generatPersonalImageVerificationId.jpg",
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
          "user-files/${ApiService.user.uid}/images/user-Verification/id-picture/$generatIdCardVerificationId.jpg",
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
              snackBar(
                message: "The request has been sent successfully".tr,
                isError: false,
              ),
            },
          );
    } catch (e) {
      verificationScreenLoding.value = false;
    }
  }
}
