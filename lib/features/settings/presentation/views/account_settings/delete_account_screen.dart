import '../widgets/account_settings/delete_account/delete_account_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete account'.tr),
      ),
      body: const DeleteAccountScreenBody(),
    );
  }
}
