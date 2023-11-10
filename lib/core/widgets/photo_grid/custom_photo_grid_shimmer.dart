import 'package:flutter/material.dart';
import '../../utils/size_screen.dart';
import '../../constant/colors.dart';
import '../custom_shimmer.dart';

class CustomPhotoGridShimmer extends StatelessWidget {
  const CustomPhotoGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return CustomShimmer(
      child: Container(
        height: size.height * .3,
        width: double.infinity,
        color: AppColors.kSurfaceColor,
      ),
    );
  }
}
