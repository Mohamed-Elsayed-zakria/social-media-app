import 'package:icon_broken/icon_broken.dart';
import '../../../../../../core/constant/style.dart';
import '../../report_problem_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenReportProblem extends StatelessWidget {
  const SettingsScreenReportProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => const ReportProblemScreen()),
      title: Text(
        "Report problem".tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle18,
        ),
      ),
      leading: const Icon(Icons.call_outlined),
      trailing: const Icon(IconBroken.Arrow___Right_2),
    );
  }
}
