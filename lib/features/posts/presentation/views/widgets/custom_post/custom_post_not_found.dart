import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostNotFount extends StatelessWidget {
  final bool vedioPage;
  const CustomPostNotFount({
    super.key,
    required this.vedioPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.kOnSurfaceColor.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: vedioPage
            ? Text(
                "There are no Vedios yet".tr,
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle20,
                  color: AppColors.kPrimaryColor,
                ),
              )
            : Text(
                "There are no posts yet".tr,
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle20,
                  color: AppColors.kPrimaryColor,
                ),
              ),
      ),
    );
  }
}
