import '../../../../controllers/delete_account_controller.dart';
import '../../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountButtomContinue extends StatelessWidget {
  const DeleteAccountButtomContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DeleteAccountController>(
      builder: (controller) => CustomButton(
        text: "Continue".tr,
        onPressed: deleteAccountIsLodinge.value == false
            ? () {
                if (formKeyDeleteAccount.currentState!.validate()) {
                  Get.defaultDialog(
                    title: 'Delete account'.tr,
                    titlePadding: const EdgeInsets.only(top: 25, bottom: 15),
                    middleText:
                        'Are you sure you want to delete the account ?'.tr,
                    middleTextStyle: const TextStyle(
                      fontSize: AppStyle.kTextStyle16,
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        Get.back();
                        controller.deleteAccount(
                          password: deleteAccountGetPassword.text,
                        );
                      },
                      child: Text('Yes'.tr),
                    ),
                    cancel: TextButton(
                      onPressed: () => Get.back(),
                      child: Text('No'.tr),
                    ),
                  );
                }
              }
            : null,
      ),
    );
  }
}
