import '../../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import '../message_of_type_images.dart';
import '../chat_date_time.dart';

class ChatOtherMessageImage extends StatelessWidget {
  final MessageModel messageData;

  const ChatOtherMessageImage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageOfTypeImages(messageData: messageData),
        ChatDateTime(dateTime: messageData.dateTime,currentMessage: false),
      ],
    );
  }
}
