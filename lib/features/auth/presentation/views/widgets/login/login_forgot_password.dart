import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const ForgotPasswordScreen()),
      child: Text(
        'Forgot your password'.tr,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppStyle.kTextStyle18,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
