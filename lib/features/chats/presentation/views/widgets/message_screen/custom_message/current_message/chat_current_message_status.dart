import '../../../../../../../../core/constant/colors.dart';
import '../../../../../../../../core/constant/style.dart';
import '../../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatCurrentMessageStatus extends StatelessWidget {
  final MessageModel messageData;

  const ChatCurrentMessageStatus({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      child: Icon(
        Icons.done_all_outlined,
        color: messageData.isRead.isNotEmpty
            ? AppColors.kPrimaryColor
            : Colors.black54,
        size: AppStyle.kTextStyle16,
      ),
    );
  }
}
