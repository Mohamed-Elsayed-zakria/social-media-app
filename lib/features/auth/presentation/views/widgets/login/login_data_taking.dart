import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDataTaking extends StatelessWidget {
  const LoginDataTaking({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyLogin,
      child: Column(
        children: [
          CustomFormField(
            controller: loginGetEmail,
            validator: (value) => loginvalidatorEmail(value: value),
            label: 'Email'.tr,
            hintText: 'Enter your Email'.tr,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
          ),
          GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => CustomFormField(
              controller: loginGetPassword,
              validator: (value) => loginvalidatorpassword(value: value),
              obscureText: controller.loginHindTextPassword ? true : false,
              label: 'Password'.tr,
              hintText: 'Enter your Password'.tr,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: () => controller.loginChangeHindText(),
                icon: controller.loginHindTextPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ],
      ),
    );
  }
}
