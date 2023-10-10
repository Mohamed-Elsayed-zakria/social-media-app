import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../controllers/add_details_controller.dart';
import 'add_details_custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsTakingGender extends StatelessWidget {
  const AddDetailsTakingGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AddDetailsCustomListTile(
        validator: validatorGender.value,
        errorMessage: 'Gender Field Empty'.tr,
        onTap: () {
          Get.defaultDialog(
            backgroundColor: Colors.white,
            titlePadding: const EdgeInsets.only(top: 22),
            title: "Gender".tr,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    gender.value = "Male".tr;
                    Get.back();
                  },
                  title: Text("Male".tr),
                ),
                ListTile(
                  onTap: () {
                    gender.value = "Female".tr;
                    Get.back();
                  },
                  title: Text("Female".tr),
                ),
              ],
            ),
          );
        },
        title: gender.value,
        leading: const Icon(
          FontAwesomeIcons.venusMars,
          size: 18,
        ),
      ),
    );
  }
}
