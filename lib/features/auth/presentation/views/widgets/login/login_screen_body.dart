import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'login_forgot_password.dart';
import '../../register_screen.dart';
import 'login_buttom_sign_in.dart';
import 'login_data_taking.dart';
import 'package:get/get.dart';
import '../header.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Column(
      children: [
        const Header(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: size.height * .72,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const LoginDataTaking(),
                      const LoginButtomSignIn(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const LoginForgotPassword(),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Create new account'.tr,
                    onPressed: () => Get.to(() => const RegisterScreen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
