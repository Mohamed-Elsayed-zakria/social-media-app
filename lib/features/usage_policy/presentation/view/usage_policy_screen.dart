import 'package:get/get.dart';

import 'widgets/usage_policy_screen_body.dart';
import 'package:flutter/material.dart';

class UsagePolicyScreen extends StatelessWidget {
  const UsagePolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('usage policy'.tr),
      ),
      body: const UsagePolicyScreenBody(),
    );
  }
}
