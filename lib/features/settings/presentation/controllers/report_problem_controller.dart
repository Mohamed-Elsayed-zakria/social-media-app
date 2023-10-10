import '../../data/reposetory/api/report_problem_api.dart';
import 'package:flutter/material.dart';

final TextEditingController getMessageReportProblem = TextEditingController();
Future<void> sentReportProblemMessage({required String text}) async {
  ReportProblemApi().sentReportProblemMessage(text: text);
}
