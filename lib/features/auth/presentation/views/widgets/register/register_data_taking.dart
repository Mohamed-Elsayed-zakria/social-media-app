import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../controllers/register_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDataTaking extends StatelessWidget {
  const RegisterDataTaking({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyRegister,
      child: Column(
        children: [
          CustomFormField(
            validator: (value) => registervalidatorEmail(value: value),
            controller: registerGetEmail,
            label: 'Email'.tr,
            hintText: 'Enter your Email'.tr,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
          ),
          GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => CustomFormField(
              validator: (value) => registervalidatorpassword(value: value),
              obscureText: controller.registerHintTextPassword ? true : false,
              controller: registerGetPassword,
              label: 'Password'.tr,
              hintText: 'Enter your Password'.tr,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: () => controller.registerChangeHindTextPassword(),
                icon: controller.registerHintTextPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => CustomFormField(
              validator: (value) =>
                  registervalidatorConfirmPassword(value: value),
              obscureText: controller.registerHintTextRePassword ? true : false,
              controller: registerGetRetypePassword,
              label: 'Confirm password'.tr,
              hintText: 'Reconfirm your password'.tr,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: () => controller.registerChangeHindTextRePassword(),
                icon: controller.registerHintTextRePassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
