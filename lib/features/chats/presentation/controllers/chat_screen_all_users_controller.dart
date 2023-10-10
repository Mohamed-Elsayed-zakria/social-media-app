import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repository/api/chat_screen_all_users_api.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToChat() {
  return ChatScreenAllUsersApi().getUserDataToChat();
}

Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessages({
  required String otherUserId,
}) {
  return ChatScreenAllUsersApi().getLastMessages(otherUserId: otherUserId);
}
