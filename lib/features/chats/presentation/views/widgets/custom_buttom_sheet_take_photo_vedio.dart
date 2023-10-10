import 'package:icon_broken/icon_broken.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomSheetTakePhotoVedio extends StatelessWidget {
  final Function() onTapUploadeImage;
  final Function() onTapUploadeVedio;
  const CustomButtomSheetTakePhotoVedio({
    super.key,
    required this.onTapUploadeImage,
    required this.onTapUploadeVedio,
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
            onTap: onTapUploadeImage,
            title: Text(
              "Uploade image".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconBroken.Image,
              size: 28,
            ),
          ),
          ListTile(
            onTap: onTapUploadeVedio,
            title: Text(
              "Uploade vedio".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconBroken.Video,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
