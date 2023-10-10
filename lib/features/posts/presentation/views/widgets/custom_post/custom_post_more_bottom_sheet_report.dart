import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';

class CustomPostMoreBottomSheetReport extends StatelessWidget {
  const CustomPostMoreBottomSheetReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: AppColors.kSurfaceColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.done,
            color: AppColors.kPrimaryColor,
            size: 40,
          ),
          const SizedBox(height: 20),
          Text(
            "The notification has been sent".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Thanks for letting now".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle18,
            ),
          ),
        ],
      ),
    );
  }
}
