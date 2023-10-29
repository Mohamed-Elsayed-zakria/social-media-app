import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreenHeaderShimmer extends StatelessWidget {
  const ProfileScreenHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);

    return SizedBox(
      height: size.height * 0.31,
      child: Stack(
        children: [
          CustomShimmer(
            child: Container(
              color: AppColors.kSurfaceColor,
              height: size.height * 0.23,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomShimmer(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: size.width * .17,
                  backgroundColor: AppColors.kSurfaceColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
