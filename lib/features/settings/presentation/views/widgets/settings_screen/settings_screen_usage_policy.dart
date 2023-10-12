import '../../../../../usage_policy/presentation/view/usage_policy_screen.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenUsagePolicy extends StatelessWidget {
  const SettingsScreenUsagePolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => const UsagePolicyScreen()),
      title: Text(
        "Usage policy".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(Icons.policy_outlined),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
