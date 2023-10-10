import 'package:flutter/material.dart';
import '../constant/colors.dart';
import 'custom_shimmer.dart';

class CustomPersonaListTileShimmer extends StatelessWidget {
  const CustomPersonaListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppColors.kBackgroundColor,
          radius: 30,
        ),
        title: Container(
          color: AppColors.kSurfaceColor,
          height: 15,
        ),
        subtitle: Container(
          color: AppColors.kSurfaceColor,
          height: 10,
        ),
      ),
    );
  }
}
