import '../../../controllers/update_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePostHeaderLoading extends StatelessWidget {
  const UpdatePostHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: updatePostLoading.value,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
