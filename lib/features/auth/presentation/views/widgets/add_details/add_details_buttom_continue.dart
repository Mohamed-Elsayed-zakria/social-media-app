import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../controllers/add_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsButtomContintue extends StatelessWidget {
  const AddDetailsButtomContintue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => addDetailsIsLodinge.value != true
          ? CustomButton(
              text: 'Continue'.tr,
              onPressed: () async {
                validatorAgeAndGender();
                if (formKeyAddDetails.currentState!.validate() &&
                    dateOfBirth.value != null &&
                    gender.value != 'Gender'.tr) {
                  addUserDataToDatabase(username: addDetailsGetUsername.text);
                }
              },
            )
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
