import '../../../../../../core/utils/show_toast.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatShowImagesButtomSheetDownloadImage extends StatelessWidget {
  final String imagePath;
  const ChatShowImagesButtomSheetDownloadImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () async {
            Get.back();
            await GallerySaver.saveImage(
              imagePath,
              albumName: "Frinds App",
            ).then((success) {
              if (success != null && success) {
                showToast(msg: 'Image downloaded'.tr);
              }
            }).catchError((e) {
              showToast(msg: "Image failed to load".tr);
            });
          },
          title: Text('Download image'.tr),
          leading: const Icon(
            IconlyBroken.download,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
