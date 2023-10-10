import 'package:flutter/material.dart';
import '../../../controllers/add_details_controller.dart';
import 'add_details_custom_list_tile.dart';
import 'package:get/get.dart';

class AddDetailsTakingAge extends StatelessWidget {
  const AddDetailsTakingAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AddDetailsCustomListTile(
        validator: validatorAge.value,
        errorMessage: 'Age Field Empty'.tr,
        onTap: () async {
          dateOfBirth.value = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: dateNow,
          );
        },
        title: dateOfBirth.value == null
            ? 'Age'.tr
            : "${dateOfBirth.value!.year}/${dateOfBirth.value!.month}/${dateOfBirth.value!.day}",
        leading: const Icon(Icons.date_range_outlined),
      ),
    );
  }
}
