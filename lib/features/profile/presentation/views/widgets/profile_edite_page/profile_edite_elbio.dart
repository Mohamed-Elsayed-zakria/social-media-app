import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../../../core/widgets/custom_form_field.dart';
import '../../../controller/profile_edite_controller.dart';
import 'profile_custom_buttom_edite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditeElbio extends StatelessWidget {
  final String elbio;
  const ProfileEditeElbio({
    super.key,
    required this.elbio,
  });

  @override
  Widget build(BuildContext context) {
    getTextBio.text = elbio;
    return GetBuilder<ProfileEditeController>(
      init: ProfileEditeController(),
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileCustomButtomEdite(
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: AppColors.kSurfaceColor,
                    titlePadding: const EdgeInsets.only(top: 20),
                    title: "Bio".tr,
                    confirm: TextButton(
                      onPressed: () {
                        if (profileKeyLogin.currentState!.validate()) {
                          controller.updateBio(text: getTextBio.text);
                          Get.back();
                        }
                      },
                      child: Text(
                        "Edite".tr,
                        style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                      ),
                    ),
                    content: Container(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Form(
                          key: profileKeyLogin,
                          child: CustomFormField(
                            controller: getTextBio,
                            validator: (value) =>
                                profilevalidatorBio(value: value),
                            keyboardType: TextInputType.multiline,
                            label: "Bio".tr,
                            hintText: "Enter New Bio".tr,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Bio".tr,
                  style: const TextStyle(fontSize: AppStyle.kTextStyle18),
                ),
              ),
            ],
          ),
          Text(
            getTextBio.text,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
    );
  }
}
