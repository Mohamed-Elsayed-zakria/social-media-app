import '../../../../core/constant/colors.dart';
import 'widgets/video_screen_body.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: VideoScreenBody(),
      ),
    );
  }
}
