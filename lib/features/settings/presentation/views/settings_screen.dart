import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/settings_screen/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr,
        ),
      ),
      body: const SettingsScreenBody(),
    );
  }
}
