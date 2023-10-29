import '../../../controllers/post_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreenHeaderLoading extends StatelessWidget {
  const PostScreenHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: addPostLoading.value,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
