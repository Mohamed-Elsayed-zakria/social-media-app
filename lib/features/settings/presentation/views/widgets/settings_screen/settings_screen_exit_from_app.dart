import '../../../controllers/settings_screen_controller.dart';
import '../../../../../../core/constant/style.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenExitFromApp extends StatelessWidget {
  const SettingsScreenExitFromApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.defaultDialog(
          title: 'log out'.tr,
          titlePadding: const EdgeInsets.only(top: 25, bottom: 15),
          content: Text(
            'Do you want to log out ?'.tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          confirm: TextButton(
            onPressed: () => exitFromApp(),
            child: Text('Yes'.tr),
          ),
          cancel: TextButton(
            onPressed: () => Get.back(),
            child: Text('No'.tr),
          ),
        );
      },
      title: Text(
        "log out".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(Icons.login_outlined),
      trailing: const Icon(IconBroken.Arrow___Right_2),
    );
  }
}
