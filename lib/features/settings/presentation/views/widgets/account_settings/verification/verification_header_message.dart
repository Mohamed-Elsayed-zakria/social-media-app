import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationHeaderMessage extends StatelessWidget {
  const VerificationHeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "applyForVerification".tr,
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.verified,
                color: AppColors.kPrimaryColor,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "verificationAcount".tr,
            style: const TextStyle(fontSize: AppStyle.kTextStyle16),
          ),
          const SizedBox(height: 8),
          Text(
            "noteVerification".tr,
            style: const TextStyle(fontSize: AppStyle.kTextStyle16),
          ),
        ],
      ),
    );
  }
}
