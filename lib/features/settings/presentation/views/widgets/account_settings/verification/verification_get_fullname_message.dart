import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../controllers/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationGetFullnameMessage extends StatelessWidget {
  const VerificationGetFullnameMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyVerification,
      child: Column(
        children: [
          CustomFormField(
            validator: (value) {
              return value!.isEmpty ? "required".tr : null;
            },
            controller: getFullName,
            maxLength: 35,
            prefixIcon: const Icon(Icons.person_outline_outlined),
            label: "fullname".tr,
            hintText: "enterFullname".tr,
          ),
          CustomFormField(
            validator: (value) {
              return value!.isEmpty ? "required".tr : null;
            },
            controller: getMessage,
            maxLines: null,
            prefixIcon: const Icon(Icons.messenger_outline_rounded),
            keyboardType: TextInputType.multiline,
            maxLength: 60,
            label: "message".tr,
            hintText: "enterTheMessage".tr,
          ),
        ],
      ),
    );
  }
}
