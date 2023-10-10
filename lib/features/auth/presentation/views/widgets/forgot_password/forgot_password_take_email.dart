import '../../../controllers/forgot_password_screen_controller.dart';
import '../../../../../../core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordTakeEmail extends StatelessWidget {
  const ForgotPasswordTakeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyForgotPassword,
      child: CustomFormField(
        controller: forgotPasswordGetEmail,
        validator: (value) => forgotPasswordValidatorEmail(value: value),
        label: 'Email'.tr,
        hintText: 'Enter your Email'.tr,
        prefixIcon: const Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
