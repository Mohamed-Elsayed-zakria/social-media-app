import '../../../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../data/models/message_model.dart';
import 'on_long_press_other_message.dart';
import 'package:flutter/material.dart';
import 'chat_other_message_image.dart';
import 'chat_other_message_video.dart';
import 'chat_other_message_text.dart';
import 'package:get/get.dart';

class CustomOtherMessage extends StatelessWidget {
  final MessageModel messageData;

  const CustomOtherMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    if (messageData.isRead.isEmpty) {
      updateMessagesReadStatus(messageData: messageData);
    }
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onLongPress: () => Get.bottomSheet(
          OnLongPressOtherMessage(messageData: messageData),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: messageData.type == TypeChatMessage.text.name
              ? ChatOtherMessageText(messageData: messageData)
              : messageData.type == TypeChatMessage.image.name
                  ? ChatOtherMessageImage(messageData: messageData)
                  : ChatOtherMessageVideo(messageData: messageData),
        ),
      ),
    );
  }
}
