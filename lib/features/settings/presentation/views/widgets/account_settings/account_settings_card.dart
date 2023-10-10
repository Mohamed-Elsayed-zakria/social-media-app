import 'package:icon_broken/icon_broken.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class AccountSettingCard extends StatelessWidget {
  final Function() onTap;
  final String text;
  const AccountSettingCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kSurfaceColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: AppStyle.kTextStyle16),
              ),
              const Icon(IconBroken.Arrow___Right),
            ],
          ),
        ),
      ),
    );
  }
}
