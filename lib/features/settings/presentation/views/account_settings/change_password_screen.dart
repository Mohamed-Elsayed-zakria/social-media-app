import 'package:get/get.dart';

import '../widgets/account_settings/change_password/change_password_screen_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Change password'.tr),
      ),
      body: const ChangePasswordScreenBody(),
    );
  }
}
