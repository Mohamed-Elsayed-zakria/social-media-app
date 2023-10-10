import 'package:flash/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  const CustomShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kSurfaceColor,
      highlightColor: AppColors.kBackgroundColor,
      child: child,
    );
  }
}
