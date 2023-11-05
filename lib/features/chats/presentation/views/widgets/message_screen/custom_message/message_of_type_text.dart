import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageOfTypeText extends StatelessWidget {
  final MessageModel messageData;
  final bool currentMessage;

  const MessageOfTypeText({
    super.key,
    required this.messageData,
    this.currentMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Text(
        messageData.message,
        style: TextStyle(
          fontSize: AppStyle.kTextStyle16,
          color: currentMessage
              ? AppColors.kSurfaceColor
              : AppColors.kOnSurfaceColor,
        ),
      ),
    );
  }
}
