import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsNoInternet extends StatelessWidget {
  const ShowReelsNoInternet({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No internet connection".tr,
        style: const TextStyle(
          color: AppColors.kSurfaceColor,
          fontSize: AppStyle.kTextStyle16,
        ),
      ),
    );
  }
}
