import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatNotFountMesssage extends StatelessWidget {
  const ChatNotFountMesssage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Say hi".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
    );
  }
}
