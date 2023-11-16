import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/api/api_service.dart';
import '../profile_edite_more_repo.dart';
import 'package:get/get.dart';

class ProfileEditeMoreApi extends ProfileEditeMoreRepo {
  @override
  Future<void> addUserToListBlock({required String otherUid}) async {
    CurrentUserData.listBlock.add(otherUid);
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      'listBlock': FieldValue.arrayUnion([otherUid]),
    }).then(
      (value) => showToast(
        msg: "The user has been blocked".tr,
      ),
    );
  }

  @override
  Future<void> deleteUserFromListBlock({required String otherUid}) async {
    CurrentUserData.listBlock.remove(otherUid);
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      'listBlock': FieldValue.arrayRemove([otherUid]),
    }).then(
      (value) => showToast(
        msg: "Done unBlock the user".tr,
      ),
    );
  }
}
