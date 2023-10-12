import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../../core/constant/style.dart';
import '../../about_us_screen.dart';

class SettingsScreenAboutUs extends StatelessWidget {
  const SettingsScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => const AboutUsScreen()),
      title: Text(
        "About us".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(Icons.info_outline),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
