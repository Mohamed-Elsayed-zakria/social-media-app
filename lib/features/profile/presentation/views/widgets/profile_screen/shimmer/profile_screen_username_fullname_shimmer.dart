import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/constant.dart';
import '../../../../../../../core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ProfileScreenUsernameFullnameShimmer extends StatelessWidget {
  const ProfileScreenUsernameFullnameShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

    return Column(
      children: [
        CustomShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 15,
            width: size.width * 0.4,
          ),
        ),
        const SizedBox(height: 20),
        CustomShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 15,
            width: size.width * 0.4,
          ),
        ),
      ],
    );
  }
}
