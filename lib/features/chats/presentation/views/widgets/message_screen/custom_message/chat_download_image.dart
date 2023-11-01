import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDownloadImages extends StatelessWidget {
  final List imgUrl;
  const ChatDownloadImages({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        Get.back();
        int count = 1;
        for (var index in imgUrl) {
          await GallerySaver.saveImage(
            index,
            albumName: "Social Frinds",
          ).then((success) {
            if (success != null && success) {
              Fluttertoast.showToast(
                msg: '${'Image downloaded'.tr} ${count++}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            }
          }).catchError((e) {
            Fluttertoast.showToast(
              msg: '${'Image failed to load'.tr} ${count++}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          });
        }
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
