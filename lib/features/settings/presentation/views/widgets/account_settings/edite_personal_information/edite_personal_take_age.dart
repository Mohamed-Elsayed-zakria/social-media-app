import '../../../../controllers/edite_personal_controller.dart';
import 'edite_personal_custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditePersonalTakeAge extends StatelessWidget {
  const EditePersonalTakeAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EditePersonalCustomListTile(
        onTap: () async {
          editePersonDateOfBirth.value = await showDatePicker(
            context: context,
            initialDate: editePersonInitialDate,
            firstDate: editePersonFirstDate,
            lastDate: editePersonDateNow,
          );
        },
        title: editePersonDateOfBirth.value == null
            ? 'Age'.tr
            : "${editePersonDateOfBirth.value!.year}/${editePersonDateOfBirth.value!.month}/${editePersonDateOfBirth.value!.day}",
        leading: const Icon(Icons.date_range_outlined),
      ),
    );
  }
}
