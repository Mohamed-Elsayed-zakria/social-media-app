import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatOtherMakeBlockMessage extends StatelessWidget {
  const ChatOtherMakeBlockMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        "You can not message this person".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
        ),
      ),
    );
  }
}
