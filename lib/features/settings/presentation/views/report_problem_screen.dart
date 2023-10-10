import 'package:get/get.dart';

import 'widgets/settings_screen/report_problem_screen_body.dart';
import 'package:flutter/material.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Problem'.tr),
      ),
      body: const ReportProblemScreenBody(),
    );
  }
}
