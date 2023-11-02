import '../../../../../../data/models/message_model.dart';
import 'on_long_press_current_message.dart';
import 'chat_current_message_image.dart';
import 'chat_current_message_text.dart';
import 'chat_current_message_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCurrentMessage extends StatelessWidget {
  final MessageModel messageData;
  const CustomCurrentMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onLongPress: () => Get.bottomSheet(
          OnLongPressCurrentMessage(messageData: messageData),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: messageData.type == TypeChatMessage.text.name
              ? ChatCurrentMessageText(messageData: messageData)
              : messageData.type == TypeChatMessage.image.name
                  ? ChatCurrentMessageImage(messageData: messageData)
                  : ChatCurrentMessageVideo(messageData: messageData),
        ),
      ),
    );
  }
}
