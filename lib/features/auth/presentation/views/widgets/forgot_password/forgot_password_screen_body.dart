import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'forgot_password_get_started.dart';
import 'forgot_password_take_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../header.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        Container(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Password recovery".tr,
                  style: const TextStyle(
                    fontSize: AppStyle.kTextStyle20,
                    color: AppColors.kOnSurfaceColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "Password recovery description".tr,
                    style: const TextStyle(
                      fontSize: AppStyle.kTextStyle18,
                      color: AppColors.kOnSurfaceColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const ForgotPasswordTakeEmail(),
                const ForgotPasswordGetStarted(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
