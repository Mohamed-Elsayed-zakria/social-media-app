import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../controllers/edite_personal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditePersonalTakeFirstLastUserName extends StatelessWidget {
  const EditePersonalTakeFirstLastUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyeditePerson,
      child: Column(
        children: [
          CustomFormField(
            validator: (value) => editePersonValidatorUsername(value: value),
            controller: editePersonGetUsername,
            label: 'username'.tr,
            hintText: 'Enter your username'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          CustomFormField(
            validator: (value) => editePersonvalidatorFirstname(value: value),
            controller: editePersonGetFirstName,
            label: 'First name'.tr,
            hintText: 'Enter your First name'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          CustomFormField(
            validator: (value) => editePersonvalidatorLastname(value: value),
            controller: editePersonGetLastName,
            label: 'Last name'.tr,
            hintText: 'Enter your Last name'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
