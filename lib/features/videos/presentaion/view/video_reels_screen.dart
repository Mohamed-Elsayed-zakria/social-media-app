import 'package:flutter/material.dart';
import '../../../../core/constant/colors.dart';
import 'widgets/video_reels/video_reels_body.dart';

class VideoReelsScreen extends StatelessWidget {
  const VideoReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: VideoReelsBody(),
    );
  }
}
