import '../../../../../../core/constant/style.dart';
import '../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomCurrentMessage extends StatelessWidget {
  final MessageModel messageData;
  const CustomCurrentMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          messageData.message,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
          ),
        ),
      ),
    );
  }
}
