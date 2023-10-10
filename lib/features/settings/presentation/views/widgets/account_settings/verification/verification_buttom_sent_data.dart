import '../../../../../../../core/widgets/custom_buttom.dart';
import '../../../../controllers/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationButtomSentData extends StatelessWidget {
  const VerificationButtomSentData({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => verificationScreenLoding.value
          ? Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: const CircularProgressIndicator(),
            )
          : CustomButton(
              onPressed: () {
                if (formKeyVerification.currentState!.validate()) {
                  submitVerification(
                    fullname: getFullName.text,
                    message: getMessage.text,
                  );
                }
              },
              text: 'apply'.tr,
            ),
    );
  }
}
