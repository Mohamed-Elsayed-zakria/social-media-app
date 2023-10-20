import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsNotFount extends StatelessWidget {
  const ShowReelsNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "There are no Vedios yet".tr,
        style: const TextStyle(
            color: AppColors.kSurfaceColor, fontSize: AppStyle.kTextStyle16),
      ),
    );
  }
}
