import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/style.dart';
import 'package:get/get.dart';

class OnLongPressOtherComment extends StatelessWidget {
  final Function() onTapReport;
  final Function() onTapCopy;

  const OnLongPressOtherComment({
    super.key,
    required this.onTapReport,
    required this.onTapCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            onTap: onTapReport,
            title: Text(
              "Report".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
            leading: const Icon(
              IconlyBroken.infoSquare,
              color: AppColors.kPrimaryColor,
            ),
          ),
          ListTile(
            onTap:onTapCopy,
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_outlined,
            ),
            title: Text(
              "Copy text".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
        ],
      ),
    );
  }
}
