import '../../../../../../data/models/message_model.dart';
import 'chat_current_message_status.dart';
import '../message_of_type_videos.dart';
import 'package:flutter/material.dart';
import '../chat_date_time.dart';

class ChatCurrentMessageVideo extends StatelessWidget {
  final MessageModel messageData;

  const ChatCurrentMessageVideo({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeVideos(messageData: messageData),
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
