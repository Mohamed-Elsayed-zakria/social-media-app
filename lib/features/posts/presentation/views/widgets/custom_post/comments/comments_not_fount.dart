import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsNotFount extends StatelessWidget {
  const CommentsNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Icon(
          color: AppColors.kPrimaryColor,
          IconlyBroken.chat,
          size: 80,
        ),
        const SizedBox(height: 25),
        Text(
          'There are no comments yet'.tr,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
