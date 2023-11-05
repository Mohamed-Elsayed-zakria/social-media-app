import '../../../../../../../core/widgets/custom_buttom.dart';
import '../../../../controllers/edite_personal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditePersonalButtomUpdate extends StatelessWidget {
  const EditePersonalButtomUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => editePersonUpdateUserData.value
          ? Container(
              margin: const EdgeInsets.only(top: 15),
              child: const CircularProgressIndicator(),
            )
          : CustomButton(
              text: 'update'.tr,
              onPressed: () async {
                if (formKeyeditePerson.currentState!.validate()) {
                  updateUserData(
                    firstname: editePersonGetFirstName.text,
                    lastname: editePersonGetLastName.text,
                    username: editePersonGetUsername.text,
                    dateTime: editePersonDateOfBirth.value.toString(),
                  );
                }
              },
            ),
    );
  }
}
