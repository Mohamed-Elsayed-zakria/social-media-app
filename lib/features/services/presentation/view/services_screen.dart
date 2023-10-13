import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/services_screen_body.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services'.tr,
        ),
      ),
      body: const ServicesScreenBody(),
    );
  }
}
