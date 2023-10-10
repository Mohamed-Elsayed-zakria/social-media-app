import 'package:flash/core/constant/style.dart';

import '../../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetX<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Type your old password'.tr,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKeyChangePassword,
              child: CustomFormField(
                obscureText: controller.hindText.value,
                controller: changePasswordGetPassword,
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
                label: "Password".tr,
                hintText: "Type your old password".tr,
              ),
            ),
            changePasswordIsLodinge.value
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    onPressed: () async {
                      if (formKeyChangePassword.currentState!.validate()) {
                        controller.changePassword(
                          oldPassword: changePasswordGetPassword.text,
                        );
                      }
                    },
                    text: "Change".tr,
                  ),
          ],
        ),
      ),
    );
  }
}
