import '../../account_settings/account_information_screen.dart';
import '../../account_settings/edite_personal_information.dart';
import '../../account_settings/change_password_screen.dart';
import '../../account_settings/blocked_users_screen.dart';
import '../../account_settings/verification_screen.dart';
import 'package:flutter/material.dart';
import 'account_settings_card.dart';
import 'package:get/get.dart';

class AccountSettingsScreenBody extends StatelessWidget {
  const AccountSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AccountSettingCard(
              onTap: () => Get.to(() => const AccountInformationScreen()),
              text: 'Account information'.tr,
            ),
            AccountSettingCard(
              onTap: () => Get.to(() => const EditePersonalInformationScreen()),
              text: 'Edite personal information'.tr,
            ),
            AccountSettingCard(
              onTap: () => Get.to(() => const VerificationScreen()),
              text: 'Verification'.tr,
            ),
            AccountSettingCard(
              onTap: () => Get.to(() => const BlockedUsersScreen()),
              text: 'Blocked users'.tr,
            ),
            AccountSettingCard(
              onTap: () => Get.to(() => const ChangePasswordScreen()),
              text: 'Change password'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
