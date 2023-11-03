import '../../../../../../../core/api/api_service.dart';
import '../../../../../data/models/message_model.dart';
import 'current_message/custom_current_message.dart';
import 'other_message/custom_other_message.dart';
import 'package:flutter/material.dart';

class ChatCustomMessage extends StatelessWidget {
  final MessageModel messageData;
  const ChatCustomMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: messageData.senderId == ApiService.user.uid,
      replacement: CustomOtherMessage(messageData: messageData),
      child: CustomCurrentMessage(messageData: messageData),
    );
  }
}
