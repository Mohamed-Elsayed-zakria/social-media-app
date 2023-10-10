import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../core/constant/constant.dart';
import 'register_buttom_sent_data.dart';
import 'package:flutter/material.dart';
import 'register_usage_policy.dart';
import 'register_data_taking.dart';
import 'package:get/get.dart';
import '../header.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Column(
      children: [
        const Header(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: size.height * .72,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      RegisterDataTaking(),
                      RegisterUsagePolicy(),
                      RegisterButtomSentData(),
                    ],
                  ),
                  CustomButton(
                    text: 'Login'.tr,
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
