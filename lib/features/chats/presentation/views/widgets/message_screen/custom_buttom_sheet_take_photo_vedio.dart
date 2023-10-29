import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/colors.dart';
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
              "Image".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconlyBroken.image,
              size: 28,
            ),
          ),
          ListTile(
            onTap: onTapUploadeVedio,
            title: Text(
              "Video".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconlyBroken.video,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
