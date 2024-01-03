import '../../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import '../message_of_type_videos.dart';
import '../chat_date_time.dart';

class ChatOtherMessageVideo extends StatelessWidget {
  final MessageModel messageData;

  const ChatOtherMessageVideo({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeVideos(messageData: messageData),
        ChatDateTime(dateTime: messageData.dateTime, currentMessage: false),
      ],
    );
  }
}
