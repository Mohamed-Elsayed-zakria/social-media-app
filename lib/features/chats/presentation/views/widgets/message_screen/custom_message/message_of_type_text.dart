import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageOfTypeText extends StatelessWidget {
  final MessageModel messageData;

  const MessageOfTypeText({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Text(
        messageData.message,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
          color: AppColors.kOnSurfaceColor,
        ),
      ),
    );
  }
}
