import '../../data/repository/api/chat_screen_messages_api.dart';
import '../../data/models/user_chat_data.dart';
import '../../data/models/message_model.dart';
import 'package:flutter/material.dart';

TextEditingController getMessageChat = TextEditingController();

Stream<List<MessageModel>> getAllMessages({required String receiverId}) {
  return ChatScreenMessagesApi().getAllMessages(
    receiverId: receiverId,
  );
}

Future<void> sentNewMessage({
  required UserChatData userData,
  required String text,
}) async {
  ChatScreenMessagesApi().sentNewMessage(
    text: text,
    userData: userData,
  );
}
