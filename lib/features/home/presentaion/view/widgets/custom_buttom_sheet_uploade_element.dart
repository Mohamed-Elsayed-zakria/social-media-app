import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomSheetUploadeElement extends StatelessWidget {
  final Function() onTapUploadePost;
  final Function() onTapUploadeStory;
  final Function() onTapUploadeReels;
  const CustomButtomSheetUploadeElement({
    super.key,
    required this.onTapUploadePost,
    required this.onTapUploadeStory,
    required this.onTapUploadeReels,
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
            onTap: onTapUploadePost,
            title: Text(
              "uploade post".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              IconlyBroken.document,
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
              IconlyBroken.paperPlus,
              color: AppColors.kPrimaryColor,
              size: 28,
            ),
          ),
          ListTile(
            onTap: onTapUploadeReels,
            title: Text(
              "uploade reels".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              IconlyBroken.video,
              color: AppColors.kPrimaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
