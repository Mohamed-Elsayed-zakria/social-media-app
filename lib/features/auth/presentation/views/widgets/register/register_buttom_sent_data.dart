import '../../../controllers/register_screen_controller.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterButtomSentData extends StatelessWidget {
  const RegisterButtomSentData({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => registerIsLodinge.value != true
          ? CustomButton(
              text: 'Register'.tr,
              onPressed: () {
                if (iAgreeToUseUsagePolicy.value) {
                  validatorCheckbox.value = false;
                } else {
                  validatorCheckbox.value = true;
                }
                if (formKeyRegister.currentState!.validate() &&
                    iAgreeToUseUsagePolicy.value == true) {
                  createNewAccount(
                    emailAddress: registerGetEmail.text,
                    password: registerGetPassword.text,
                  );
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
