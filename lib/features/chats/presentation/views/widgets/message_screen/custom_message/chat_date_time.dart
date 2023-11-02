import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../../../core/utils/date_time.dart';
import 'package:flutter/material.dart';

class ChatDateTime extends StatelessWidget {
  final String dateTime;
  const ChatDateTime({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      MyDateUtil.convertDateTime(
        historyAsText: dateTime,
      ),
      style: const TextStyle(
        fontSize: AppStyle.kTextStyle12,
        color: AppColors.kOnSurfaceColor,
      ),
    );
  }
}
