import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomVerifiedInCircalAvatar extends StatelessWidget {
  final bool visible;
  const CustomVerifiedInCircalAvatar({
    super.key,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Visibility(
        visible: visible,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kSurfaceColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.verified,
            size: 18,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
