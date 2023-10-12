import 'widgets/message_screen/message_screen_custom_header.dart';
import 'widgets/message_screen/chat_screen_messages_body.dart';
import '../../data/models/user_chat_data.dart';
import 'package:flutter/material.dart';

class ChatScreenMessages extends StatelessWidget {
  final UserChatData userData;
  const ChatScreenMessages({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MessageScreenCustomHeader(userData: userData),
      ),
      body: ChatScreenMessagesBody(userData: userData),
    );
  }
}
