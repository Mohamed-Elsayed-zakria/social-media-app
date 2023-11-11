import '../../../../controllers/delete_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountLoading extends StatelessWidget {
  const DeleteAccountLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: deleteAccountIsLodinge.value,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
