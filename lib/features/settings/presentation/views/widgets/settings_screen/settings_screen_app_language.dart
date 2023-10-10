import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import '../../../../../../core/constant/style.dart';

class SettingsScreenAppLanguage extends StatelessWidget {
  const SettingsScreenAppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.defaultDialog(
          title: 'Application language'.tr,
          titlePadding: const EdgeInsets.only(top: 25, bottom: 10),
          content: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.updateLocale(const Locale('en'));
                  Get.back();
                },
                title: Text(
                  'English'.tr,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.updateLocale(const Locale('ar'));
                  Get.back();
                },
                title: Text(
                  'Arabic'.tr,
                ),
              ),
            ],
          ),
        );
      },
      title: Text(
        "Application language".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(
        Icons.language_outlined,
        color: Colors.black54,
        size: 26,
      ),
      trailing: const Icon(IconBroken.Arrow___Right_2),
    );
  }
}
