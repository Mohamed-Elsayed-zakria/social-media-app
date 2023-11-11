import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../../model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/show_toast.dart';
import '../../constant/colors.dart';
import '../../constant/style.dart';
import 'package:get/get.dart';

class OnLongPressOtherComment extends StatelessWidget {
  final CommentModel commentData;
  final Function() onTapReport;

  const OnLongPressOtherComment({
    super.key,
    required this.onTapReport,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          ListTile(
            onTap: onTapReport,
            title: Text(
              "Report".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
            leading: const Icon(
              IconlyBroken.infoSquare,
              color: AppColors.kPrimaryColor,
            ),
          ),
          Visibility(
            visible: commentData.textComment == CommentType.text.name,
            replacement: ListTile(
              onTap: () {
                Get.back();
                GallerySaver.saveImage(
                  commentData.imageUrlComment,
                  albumName: "Social Frinds",
                ).then((success) {
                  if (success != null && success) {
                    showToast(msg: 'Image downloaded'.tr);
                  }
                }).catchError((e) {
                  showToast(msg: 'Image failed to load'.tr);
                });
              },
              leading: const Icon(
                color: AppColors.kPrimaryColor,
                IconlyBroken.download,
              ),
              title: Text(
                'Download image'.tr,
                style: const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
            child: ListTile(
              onTap: () {
                Get.back();
                Clipboard.setData(ClipboardData(text: commentData.textComment))
                    .then(
                  (value) => showToast(msg: "The text has been copied".tr),
                );
              },
              leading: const Icon(
                color: AppColors.kPrimaryColor,
                Icons.copy_all_outlined,
              ),
              title: Text(
                "Copy text".tr,
                style: const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
