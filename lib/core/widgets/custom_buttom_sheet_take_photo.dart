import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../constant/colors.dart';
import 'package:get/get.dart';

class CustomButtomSheetTakePhoto extends StatelessWidget {
  final Function() onTapFromGalary;
  final Function() onTapFromCamera;
  const CustomButtomSheetTakePhoto({
    super.key,
    required this.onTapFromGalary,
    required this.onTapFromCamera,
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
            onTap: onTapFromGalary,
            title: Text(
              "From Galary".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconlyBroken.image,
              size: 28,
            ),
          ),
          ListTile(
            onTap: onTapFromCamera,
            title: Text(
              "From Camera".tr,
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              color: AppColors.kSecondeColor,
              IconlyBroken.camera,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
