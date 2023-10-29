import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/models/message_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'chat_download_image_or_copytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLongPressCurrentMessage extends StatelessWidget {
  final MessageModel messageData;

  const OnLongPressCurrentMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChatDownloadImageOrCopyText(messageData: messageData),
          ListTile(
            onTap: () {
              Fluttertoast.showToast(
                msg: "The message has been deleted".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              Get.back();
            },
            title: Text("Delete message".tr),
            leading: const Icon(
              IconlyBroken.delete,
              color: AppColors.kPrimaryColor,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
