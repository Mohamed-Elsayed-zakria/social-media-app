import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreenBody extends StatelessWidget {
  const AboutUsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'It was designed and developed'.tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
        ),
      ),
    );
  }
}
