import '../../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import '../message_of_type_text.dart';
import '../chat_date_time.dart';

class ChatOtherMessageText extends StatelessWidget {
  final MessageModel messageData;

  const ChatOtherMessageText({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeText(messageData: messageData),
        ChatDateTime(dateTime: messageData.dateTime),
      ],
    );
  }
}
