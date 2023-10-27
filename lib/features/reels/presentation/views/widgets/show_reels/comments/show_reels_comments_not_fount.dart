import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsCommentsNotFount extends StatelessWidget {
  const ShowReelsCommentsNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
