import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../controllers/delete_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountTakePassword extends StatelessWidget {
  const DeleteAccountTakePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DeleteAccountController>(
      init: DeleteAccountController(),
      builder: (controller) => Form(
        key: formKeyDeleteAccount,
        child: CustomFormField(
          label: "Password".tr,
          hintText: "Enter your Password".tr,
          controller: deleteAccountGetPassword,
          obscureText: controller.hindText.value,
          validator: (value) {
            return value!.isEmpty ? "Password field empty".tr : null;
          },
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            onPressed: () {
              controller.changeHindText();
            },
            icon: Icon(
              controller.hindText.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ),
      ),
    );
  }
}
