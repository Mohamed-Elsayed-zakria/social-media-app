import 'package:flash/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

class NoticeScreenNotFound extends StatelessWidget {
  const NoticeScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            IconBroken.Notification,
            size: 80,
            color: AppColors.kPrimaryColor,
          ),
          const SizedBox(height: 25),
          Text(
            "You have no notifications".tr,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
