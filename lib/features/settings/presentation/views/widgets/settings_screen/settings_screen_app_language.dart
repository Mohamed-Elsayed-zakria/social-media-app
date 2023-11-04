import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flash/core/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenAppLanguage extends StatelessWidget {
  const SettingsScreenAppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.defaultDialog(
          title: 'Language'.tr,
          titlePadding: const EdgeInsets.only(top: 25, bottom: 10),
          content: Column(
            children: [
              ListTile(
                onTap: () {
                  appStorage.write('language', 'en');
                  Get.updateLocale(const Locale('en'));
                  Get.back();
                },
                title: Text(
                  'English'.tr,
                ),
              ),
              ListTile(
                onTap: () {
                  appStorage.write('language', 'ar');
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
        "Language".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(
        Icons.language_outlined,
        size: 26,
      ),
      trailing: const Icon(IconlyBroken.arrowRight2),
    );
  }
}
