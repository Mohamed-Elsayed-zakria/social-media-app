import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatScreenAllUsersRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToChat();
  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessages({
    required String otherUserId,
  });
}
