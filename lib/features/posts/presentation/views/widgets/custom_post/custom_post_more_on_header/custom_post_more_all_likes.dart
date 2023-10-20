import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../custom_post_show_all_likes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostMoreAllLikes extends StatelessWidget {
  final String postUid;
  const CustomPostMoreAllLikes({
    super.key,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.off(
        () => CustomPostShowAllLikes(postUid: postUid),
      ),
      leading: const Icon(
        color: AppColors.kPrimaryColor,
        IconlyBroken.heart,
      ),
      title: Text(
        'All Likes'.tr,
        style: const TextStyle(fontSize: AppStyle.kTextStyle18),
      ),
    );
  }
}
