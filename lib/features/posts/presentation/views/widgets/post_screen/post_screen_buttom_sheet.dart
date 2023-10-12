import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/colors.dart';

class PostScreenButtomSheet extends StatelessWidget {
  final Function() onTapUploadeImage;
  final Function() onTapUploadeVideo;
  const PostScreenButtomSheet({
    super.key,
    required this.onTapUploadeImage,
    required this.onTapUploadeVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: onTapUploadeImage,
            title: Text('Uploade Image'.tr),
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.image,
            ),
          ),
          ListTile(
            onTap: onTapUploadeVideo,
            title: Text('Uploade Video'.tr),
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.video,
            ),
          ),
        ],
      ),
    );
  }
}
