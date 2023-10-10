import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/settings_screen/about_us_screen_body.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'.tr),
      ),
      body: const AboutUsScreenBody(),
    );
  }
}
