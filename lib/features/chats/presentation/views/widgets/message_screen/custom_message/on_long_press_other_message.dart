import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'chat_copy_text.dart';
import 'chat_download_image.dart';
import 'chat_report_message.dart';

class OnLongPressOtherMessage extends StatelessWidget {
  final MessageModel messageData;

  const OnLongPressOtherMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
          ChatReportMessage(messageData: messageData),
        ],
      ),
    );
  }
}
