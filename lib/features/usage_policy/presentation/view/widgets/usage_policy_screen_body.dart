import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsagePolicyScreenBody extends StatelessWidget {
  const UsagePolicyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Description of the usage policy".tr,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
          ),
        ),
      ),
    );
  }
}
