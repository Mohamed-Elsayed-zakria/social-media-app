import 'package:get/get.dart';

import '../widgets/account_settings/account_settings_screen_body.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account settings'.tr),
      ),
      body: const AccountSettingsScreenBody(),
    );
  }
}
