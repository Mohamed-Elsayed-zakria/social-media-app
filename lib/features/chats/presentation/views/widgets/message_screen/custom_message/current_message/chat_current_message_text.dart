import '../../../../../../data/models/message_model.dart';
import 'chat_current_message_status.dart';
import 'package:flutter/material.dart';
import '../message_of_type_text.dart';
import '../chat_date_time.dart';

class ChatCurrentMessageText extends StatelessWidget {
  final MessageModel messageData;

  const ChatCurrentMessageText({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeText(messageData: messageData),
        Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          children: [
            ChatCurrentMessageStatus(messageData: messageData),
            ChatDateTime(dateTime: messageData.dateTime),
          ],
        ),
      ],
    );
  }
}
