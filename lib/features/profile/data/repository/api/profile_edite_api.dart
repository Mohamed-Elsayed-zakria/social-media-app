import '../../../presentation/controller/profile_edite_controller.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_service.dart';
import '../profile_edite_repo.dart';
import 'package:uuid/uuid.dart';

class ProfileEditeApi extends ProfileEditeRepo {
  @override
  Future<void> uploadImagePicture() async {
    try {
      if (updateImgPathPicture.value != null) {
        updateIsLodinge.value = true;
        String generatPersonalImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/personal-image/$generatPersonalImageId.jpg",
        );
        await storageRef.putFile(updateImgPathPicture.value!);

        String url = await storageRef.getDownloadURL();

        CurrentUserData.takePersonalPicture(url);

        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({
          'personalPicture': url,
        });
        imgPathPictureLoding.value = null;
        updateIsLodinge.value = false;
      }
    } catch (e) {
      updateIsLodinge.value = false;
    }
  }

  @override
  Future<void> uploadImageCover() async {
    try {
      if (updateImgPathCover.value != null) {
        updateIsLodinge.value = true;
        String generatCoverImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          "user-images/${ApiService.user.uid}/personal-image/$generatCoverImageId.jpg",
        );
        await storageRef.putFile(updateImgPathCover.value!);

        String url = await storageRef.getDownloadURL();
        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({
          'coverPhoto': url,
        });
        imgPathCoverLoding.value = null;
        updateIsLodinge.value = false;
      }
    } catch (e) {
      updateIsLodinge.value = false;
    }
  }

  @override
  Future<void> updateBio({required String text}) async {
    try {
      updateIsLodinge.value = true;
      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .update({'bio': text});
      updateIsLodinge.value = false;
    } catch (e) {
      updateIsLodinge.value = false;
    }
  }
}
