import '../../../../../settings/presentation/views/account_settings_screen.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileScreenCurrentMoreButtom extends StatelessWidget {
  final ProfileScreenModel userData;

  const ProfileScreenCurrentMoreButtom({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Get.to(() => const AccountSettingsScreen());
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.setting,
            ),
            title: Text("Account settings".tr),
          ),
          ListTile(
            onTap: () {
              Clipboard.setData(ClipboardData(text: userData.personalPageUrl))
                  .then(
                (value) => showToast(msg: "The text has been copied".tr),
              );

              Get.back();
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_outlined,
            ),
            title: Text(
              "Copy the page link".tr,
            ),
          ),
        ],
      ),
    );
  }
}
