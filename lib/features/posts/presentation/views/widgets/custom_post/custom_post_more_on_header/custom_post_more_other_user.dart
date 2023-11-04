import '../../../../controllers/custom_post_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../custom_post_more_bottom_sheet_report.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../data/model/post_model.dart';
import 'custom_post_more_all_likes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostMoreOtherUser extends StatelessWidget {
  final PostModel postData;

  const CustomPostMoreOtherUser({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
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
            onTap: () async {
              await reportThePost(data: postData);
              Get.back();
              Get.bottomSheet(const CustomPostMoreBottomSheetReport());
            },
            leading: const Icon(
              IconlyBroken.infoSquare,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              "Report".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
          ListTile(
            onTap: () async {
              await addSavedItems(data: postData);
              Get.back();
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.bookmark,
            ),
            title: Text(
              "Save post".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
          CustomPostMoreAllLikes(postUid: postData.postUid),
        ],
      ),
    );
  }
}
