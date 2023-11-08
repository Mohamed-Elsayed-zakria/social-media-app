import '../../../../../../../core/utils/show_toast.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatCopyText extends StatelessWidget {
  final String textMessage;

  const ChatCopyText({
    super.key,
    required this.textMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Clipboard.setData(
          ClipboardData(text: textMessage),
        ).then(
          (value) => showToast(msg: "The text has been copied".tr),
        );
      },
      title: Text("Copy text".tr),
      leading: const Icon(
        Icons.copy_all_rounded,
        color: AppColors.kPrimaryColor,
        size: 26,
      ),
    );
  }
}
