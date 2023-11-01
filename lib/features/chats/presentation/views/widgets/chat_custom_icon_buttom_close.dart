import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCustomIconButtomClose extends StatelessWidget {
  const ChatCustomIconButtomClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          color: AppColors.kSurfaceColor,
          Icons.close_outlined,
          size: 28,
        ),
      ),
    );
  }
}
