import '../../data/models/user_chat_data.dart';
import '../../data/repository/api/chat_screen_messages_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

TextEditingController getMessageChat = TextEditingController();

Future<void> sentNewMessage({
  required UserChatData userData,
  required String text,
}) async {
  ChatScreenMessagesApi().sentNewMessage(
    text: text,
    userData: userData,
  );
}

Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
  required String receiverId,
}) {
  return ChatScreenMessagesApi().getAllMessages(
    receiverId: receiverId,
  );
}
