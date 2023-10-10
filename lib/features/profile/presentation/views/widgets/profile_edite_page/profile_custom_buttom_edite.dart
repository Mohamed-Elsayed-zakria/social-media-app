import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';

class ProfileCustomButtomEdite extends StatelessWidget {
  final Function() onPressed;
  const ProfileCustomButtomEdite({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.kSurfaceColor),
      ),
      child: Text(
        "Edite".tr,
        style: const TextStyle(fontSize: AppStyle.kTextStyle16),
      ),
    );
  }
}
