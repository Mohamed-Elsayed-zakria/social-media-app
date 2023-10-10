import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../controllers/add_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsTakingData extends StatelessWidget {
  const AddDetailsTakingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyAddDetails,
      child: Column(
        children: [
          CustomFormField(
            validator: (value) => addDetailsValidatorUsername(value: value),
            controller: addDetailsGetUsername,
            label: 'username'.tr ,
            hintText: 'Enter your username'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          CustomFormField(
            validator: (value) => addDetailsvalidatorFirstname(value: value),
            controller: addDetailsGetFirstName,
            label: 'First name'.tr,
            hintText: 'Enter your First name'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          CustomFormField(
            validator: (value) => addDetailsvalidatorLastname(value: value),
            controller: addDetailsGetLastName,
            label: 'Last name'.tr,
            hintText: 'Enter your Last name'.tr,
            prefixIcon: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
