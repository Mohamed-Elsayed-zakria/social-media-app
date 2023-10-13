import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../chat_screen_all_users_repo.dart';

class ChatScreenAllUsersApi extends ChatScreenAllUsersRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToChat() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessages({
    required String otherUserId,
  }) {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUserId)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .orderBy("dateTime", descending: true)
        .limit(1)
        .snapshots();
  }
}
