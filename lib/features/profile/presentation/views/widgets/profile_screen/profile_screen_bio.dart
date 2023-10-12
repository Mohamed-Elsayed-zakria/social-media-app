import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenBio extends StatelessWidget {
  final String textBio;
  const ProfileScreenBio({
    super.key,
    required this.textBio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(
            IconlyBroken.infoCircle,
            color: AppColors.kPrimaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            "Bio".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              textBio,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
