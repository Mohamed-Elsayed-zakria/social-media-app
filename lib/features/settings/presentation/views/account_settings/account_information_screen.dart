import '../widgets/account_settings/account_information/account_information_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account information'.tr),
      ),
      body: const AccountInformationScreenBody(),
    );
  }
}
