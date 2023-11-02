import '../../../../../../data/models/message_model.dart';
import 'chat_current_message_status.dart';
import '../message_of_type_images.dart';
import 'package:flutter/material.dart';
import '../chat_date_time.dart';

class ChatCurrentMessageImage extends StatelessWidget {
  final MessageModel messageData;

  const ChatCurrentMessageImage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeImages(messageData: messageData),
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
