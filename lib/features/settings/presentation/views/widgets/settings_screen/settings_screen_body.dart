import 'settings_screen_about_us.dart';
import 'settings_screen_app_language.dart';
import 'settings_screen_custom_profile_card.dart';
import 'settings_screen_account_settings.dart';
import 'settings_screen_report_problem.dart';
import 'settings_screen_exit_from_app.dart';
import 'package:flutter/material.dart';
import 'settings_screen_usage_policy.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SettingsScreenCustomProfileCard(),
        SettingsScreenAccountSettings(),
        SettingsScreenUsagePolicy(),
        SettingsScreenReportProblem(),
        SettingsScreenAboutUs(),
        SettingsScreenAppLanguage(),
        SettingsScreenExitFromApp(),
      ],
    );
  }
}
