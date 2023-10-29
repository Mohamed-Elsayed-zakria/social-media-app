import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../core/utils/size_screen.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomStoryShimmer extends StatelessWidget {
  const CustomStoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return SizedBox(
      width: size.width * .24,
      child: Column(
        children: [
          CustomShimmer(
            child: CircleAvatar(
              radius: size.width * .110,
            ),
          ),
          const SizedBox(height: 6),
          CustomShimmer(
            child: Container(
              width: size.width * .20,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.kSurfaceColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
