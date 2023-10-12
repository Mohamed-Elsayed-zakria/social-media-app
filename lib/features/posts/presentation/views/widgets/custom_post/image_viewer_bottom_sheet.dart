import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/colors.dart';

class ImageViewerBottomSheet extends StatelessWidget {
  final String imagePath;
  const ImageViewerBottomSheet({
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
            await GallerySaver.saveImage(
              imagePath,
              albumName: "Frinds App",
            ).then((success) {
              if (success != null && success) {
                Get.back();
                Fluttertoast.showToast(
                  msg: 'Download image done'.tr,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              }
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
