import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_chat_data.dart';

abstract class ChatScreenMessagesRepo {
  Future<void> sentNewMessage({
    required String text,
    required UserChatData userData,
  });
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String receiverId,
  });
}
