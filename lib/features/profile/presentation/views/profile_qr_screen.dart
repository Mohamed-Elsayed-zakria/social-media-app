import 'widgets/profile_qr_screen/profile_qr_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileQrScreen extends StatelessWidget {
  const ProfileQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'.tr),
      ),
      body: const ProfileQrScreenBody(),
    );
  }
}
