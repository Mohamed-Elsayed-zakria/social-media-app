import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../../../core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ProfileScreenCurrentUserShimmer extends StatelessWidget {
  const ProfileScreenCurrentUserShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomShimmer(
              child: Icon(Icons.more_vert_rounded),
            ),
            CustomShimmer(
              child: Container(
                height: 50,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ),
            CustomShimmer(
              child: Container(
                height: 50,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
}
