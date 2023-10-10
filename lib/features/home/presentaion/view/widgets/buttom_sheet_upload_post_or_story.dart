import 'package:icon_broken/icon_broken.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomSheetUploadPostOrStory extends StatelessWidget {
  final Function() onTapUploadePost;
  final Function() onTapUploadeStory;
  const ButtomSheetUploadPostOrStory({
    super.key,
    required this.onTapUploadePost,
    required this.onTapUploadeStory,
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
          ListTile(
            onTap: onTapUploadePost,
            title: Text(
              "uploade post".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              IconBroken.Document,
              color: AppColors.kPrimaryColor,
              size: 28,
            ),
          ),
          ListTile(
            onTap: onTapUploadeStory,
            title: Text(
              "uploade story".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              IconBroken.Paper_Plus,
              color: AppColors.kPrimaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
