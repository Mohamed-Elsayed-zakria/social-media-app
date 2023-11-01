import '../../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/models/message_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDeleteMessage extends StatelessWidget {
  final MessageModel messageData;

  const ChatDeleteMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.defaultDialog(
          backgroundColor: AppColors.kSurfaceColor,
          titlePadding: const EdgeInsets.only(top: 20),
          title: "Delete Message ?".tr,
          titleStyle: const TextStyle(
            fontSize: AppStyle.kTextStyle20,
          ),
          confirm: TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel".tr,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
              ),
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () async {
                    Get.back();
                    deleteMessageForEveryone(
                      messageData: messageData,
                    );
                  },
                  child: Text('Delete for everyone'.tr),
                ),
                TextButton(
                  onPressed: () async {
                    Get.back();
                    deleteMessageForMe(
                      messageData: messageData,
                    );
                  },
                  child: Text('Delete for me'.tr),
                ),
              ],
            ),
          ),
        );
      },
      title: Text("Delete message".tr),
      leading: const Icon(
        IconlyBroken.delete,
        color: AppColors.kPrimaryColor,
        size: 26,
      ),
    );
  }
}
