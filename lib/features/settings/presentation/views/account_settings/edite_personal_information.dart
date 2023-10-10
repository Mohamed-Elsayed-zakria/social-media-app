import 'package:get/get.dart';

import '../widgets/account_settings/edite_personal_information/edite_personal_information_body.dart';
import 'package:flutter/material.dart';

class EditePersonalInformationScreen extends StatelessWidget {
  const EditePersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite personal information'.tr),
      ),
      body: const EditePersonalInformationScreenBody(),
    );
  }
}
