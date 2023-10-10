import '../../../../../../core/constant/style.dart';
import 'package:icon_broken/icon_broken.dart';
import '../../account_settings/account_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenAccountSettings extends StatelessWidget {
  const SettingsScreenAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => const AccountSettingsScreen()),
      title: Text(
        "Account settings".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(Icons.person_outline_outlined),
      trailing: const Icon(IconBroken.Arrow___Right_2),
    );
  }
}
