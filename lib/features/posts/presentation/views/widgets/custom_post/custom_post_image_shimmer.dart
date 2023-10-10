import '../../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomPostImageShimmer extends StatelessWidget {
  const CustomPostImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return CustomShimmer(
      child: Container(
        height: size.height * .35,
        width: double.infinity,
        color: AppColors.kSurfaceColor,
      ),
    );
  }
}
