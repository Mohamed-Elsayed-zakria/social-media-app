import '../../../controllers/forgot_password_screen_controller.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordGetStarted extends StatelessWidget {
  const ForgotPasswordGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => forgotPasswordIsLodinge.value != true
          ? CustomButton(
              text: 'Get Started'.tr,
              onPressed: () {
                if (formKeyForgotPassword.currentState!.validate()) {
                  forgotPassword(text: forgotPasswordGetEmail.text);
                }
              },
            )
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
