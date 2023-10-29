import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/message_model.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatDownloadImageOrCopyText extends StatelessWidget {
  final MessageModel messageData;

  const ChatDownloadImageOrCopyText({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return messageData.type == Type.text.name
        ? ListTile(
            onTap: () {
              Get.back();
              Clipboard.setData(
                ClipboardData(text: messageData.message),
              );
              Fluttertoast.showToast(
                msg: "The text has been copied".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
            title: Text("Copy text".tr),
            leading: const Icon(
              Icons.copy_all_rounded,
              color: AppColors.kPrimaryColor,
              size: 26,
            ),
          )
        : ListTile(
            onTap: () async {
              Get.back();
              await GallerySaver.saveImage(
                messageData.message,
                albumName: "Social Frinds",
              ).then((success) {
                if (success != null && success) {
                  Fluttertoast.showToast(
                    msg: 'Image downloaded'.tr,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              }).catchError((e) {
                Fluttertoast.showToast(
                  msg: 'Image failed to load'.tr,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              });
            },
            title: Text('Download image'.tr),
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.download,
              size: 26,
            ),
          );
  }
}
