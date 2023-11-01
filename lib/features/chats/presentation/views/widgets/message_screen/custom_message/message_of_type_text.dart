import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/utils/date_time.dart';
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
      child: RichText(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: messageData.message,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
            color: AppColors.kOnSurfaceColor,
          ),
          children: [
            const TextSpan(text: '\n\n', style: TextStyle(fontSize: 4.5)),
            TextSpan(
              text: MyDateUtil.convertDateTime(
                historyAsText: messageData.dateTime,
              ),
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle12,
                color: AppColors.kOnSurfaceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
