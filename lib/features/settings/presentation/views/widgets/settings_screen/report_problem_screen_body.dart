import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../controllers/report_problem_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportProblemScreenBody extends StatelessWidget {
  const ReportProblemScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Write the message'.tr),
          const SizedBox(height: 20),
          CustomFormField(
            prefixIcon: const Icon(Icons.messenger_outline_rounded),
            controller: getMessageReportProblem,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            maxLength: 60,
            label: "Message".tr,
            hintText: "Enter the message".tr,
          ),
          CustomButton(
            onPressed: () {
              sentReportProblemMessage(text: getMessageReportProblem.text);
            },
            text: "Send".tr,
          )
        ],
      ),
    );
  }
}
