import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'chat_download_image.dart';
import 'chat_delete_message.dart';
import 'chat_edite_message.dart';
import 'chat_copy_text.dart';

class OnLongPressCurrentMessage extends StatelessWidget {
  final MessageModel messageData;

  const OnLongPressCurrentMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: messageData.type == TypeChatMessage.text.name
          ? 185
          : messageData.type == TypeChatMessage.video.name
              ? 75
              : 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: messageData.type == TypeChatMessage.text.name,
            child: ChatCopyText(textMessage: messageData.message),
          ),
          Visibility(
            visible: messageData.type == TypeChatMessage.image.name,
            child: ChatDownloadImages(imgUrl: messageData.imgUrl),
          ),
          Visibility(
            visible: messageData.type == TypeChatMessage.text.name,
            child: ChstEditeMessage(messageData: messageData),
          ),
          ChatDeleteMessage(messageData: messageData),
        ],
      ),
    );
  }
}
