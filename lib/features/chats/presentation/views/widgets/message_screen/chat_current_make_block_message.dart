import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCurrentMakeBlockMessage extends StatelessWidget {
  const ChatCurrentMakeBlockMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        "You have blocked this user".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
        ),
      ),
    );
  }
}
