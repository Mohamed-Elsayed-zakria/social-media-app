import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../profile_edite_more_repo.dart';

class ProfileEditeMoreApi extends ProfileEditeMoreRepo {
  @override
  Future<void> addUserToListBlock({required String otherUid}) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      'listBlock': FieldValue.arrayUnion([otherUid]),
    });

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUid)
        .update({
      'listBlock': FieldValue.arrayUnion([ApiService.user.uid]),
    });
  }

  @override
  Future<void> deleteUserFromListBlock({required String otherUid}) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      'listBlock': FieldValue.arrayRemove([otherUid]),
    });

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUid)
        .update({
      'listBlock': FieldValue.arrayRemove([ApiService.user.uid]),
    });
  }
}
