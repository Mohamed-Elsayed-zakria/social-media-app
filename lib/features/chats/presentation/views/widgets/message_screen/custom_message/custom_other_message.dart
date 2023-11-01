import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/models/message_model.dart';
import 'on_long_press_other_message.dart';
import 'package:flutter/material.dart';
import 'chat_custom_message.dart';
import 'package:get/get.dart';

class CustomOtherMessage extends StatelessWidget {
  final MessageModel messageData;

  const CustomOtherMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onLongPress: () => Get.bottomSheet(
          OnLongPressOtherMessage(messageData: messageData),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ChatCustomMessage(messageData: messageData),
        ),
      ),
    );
  }
}
