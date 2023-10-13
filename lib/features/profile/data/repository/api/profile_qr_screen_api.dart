import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../profile_qr_screen_repo.dart';

class ProfileQrScreenApi extends ProfileQrScreenRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileQrScreen() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();
  }
}
