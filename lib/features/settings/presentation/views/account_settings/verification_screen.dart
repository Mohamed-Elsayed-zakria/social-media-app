import 'package:get/get.dart';

import '../widgets/account_settings/verification/verification_screen_body.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Verification'.tr),
      ),
      body: const VerificationScreenBody(),
    );
  }
}
