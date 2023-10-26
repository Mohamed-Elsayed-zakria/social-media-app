import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../../../core/utils/date_time.dart';
import '../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: messageData.message,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
              color: AppColors.kOnSurfaceColor,
            ),
            children: [
              const TextSpan(text: '\n\n', style: TextStyle(fontSize: 6)),
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
      ),
    );
  }
}
