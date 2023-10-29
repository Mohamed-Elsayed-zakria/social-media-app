import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../../../core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ProfileScreenCountFollowersFollowingShimmer extends StatelessWidget {
  const ProfileScreenCountFollowersFollowingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomShimmer(
          child: Container(
            color: AppColors.kSurfaceColor,
            height: 3,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCount(context: context),
            buildCount(context: context),
          ],
        ),
        const SizedBox(height: 12),
        CustomShimmer(
          child: Container(
            color: AppColors.kSurfaceColor,
            height: 3,
            width: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget buildCount({required BuildContext context}) {
    final size = sizeScreen(context: context);

    return Column(
      children: [
        CustomShimmer(
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomShimmer(
          child: Container(
            height: 12,
            width: size.width * .25,
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
