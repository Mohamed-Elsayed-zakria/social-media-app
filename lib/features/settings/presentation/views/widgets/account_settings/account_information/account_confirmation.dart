import '../../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountConfirmation extends StatelessWidget {
  const AccountConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Email".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            color: AppColors.kSurfaceColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ApiService.user.email.toString(),
                        style: const TextStyle(
                          fontSize: AppStyle.kTextStyle16,
                        ),
                      ),
                      Visibility(
                        visible: !ApiService.user.emailVerified,
                        child:  Row(
                          children: [
                            Text(
                              "No confirmed".tr,
                              style:const TextStyle(
                                color: AppColors.kErrorColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 5),
                           const Icon(
                              Icons.warning_amber_outlined,
                              color: AppColors.kErrorColor,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: !ApiService.user.emailVerified,
            child:  Padding(
              padding:const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'After confirming the account'.tr,
                style:const TextStyle(
                  color: AppColors.kErrorColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !ApiService.user.emailVerified,
            child: CustomButton(
              onPressed: () async {
                await ApiService.user.sendEmailVerification();
                Get.snackbar(
                  "Done".tr,
                  "A verification link has been sent email".tr,
                  backgroundColor: AppColors.kSecondeColor,
                  colorText: AppColors.kSurfaceColor,
                );
              },
              text: 'Account confirmation'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
