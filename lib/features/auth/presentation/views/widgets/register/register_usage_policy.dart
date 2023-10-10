import '../../../../../usage_policy/presentation/view/usage_policy_screen.dart';
import '../../../controllers/register_screen_controller.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterUsagePolicy extends StatelessWidget {
  const RegisterUsagePolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.to(() => const UsagePolicyScreen()),
          child: Text(
            'I agree to the usage policy'.tr,
            style: const TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: AppStyle.kTextStyle16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kPrimaryColor,
            ),
          ),
        ),
        Obx(
          () => Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: iAgreeToUseUsagePolicy.value,
            fillColor: validatorCheckbox.value
                ? const MaterialStatePropertyAll(AppColors.kErrorColor)
                : null,
            onChanged: (value) {
              iAgreeToUseUsagePolicy.value = value!;
            },
          ),
        ),
      ],
    );
  }
}
