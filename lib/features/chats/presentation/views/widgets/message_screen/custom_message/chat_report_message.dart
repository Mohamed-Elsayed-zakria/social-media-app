import '../../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatReportMessage extends StatelessWidget {
  final MessageModel messageData;

  const ChatReportMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        reportMessage(messageData: messageData);
      },
      leading: const Icon(
        IconlyBroken.infoSquare,
        color: AppColors.kPrimaryColor,
      ),
      title: Text(
        "Report".tr,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
