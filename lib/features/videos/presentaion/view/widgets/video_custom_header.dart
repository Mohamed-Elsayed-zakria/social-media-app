import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import '../../../../reels/presentation/views/show_reels_screen.dart';
import 'package:get/get.dart';
import '../video_screen.dart';

class VideoCustomHeader extends StatelessWidget {
  const VideoCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kSurfaceColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kOnSurfaceColor.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Get.to(() => const VideoScreen()),
                  child: Text('Videos'.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => Get.to(() => const ShowReelsScreen()),
                  child: Text('Reels'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
