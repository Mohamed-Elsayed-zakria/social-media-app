import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class VideoReelsCustomUsername extends StatelessWidget {
  final VideoReelsModel allReels;
  const VideoReelsCustomUsername({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        textDirection: TextDirection.ltr,
        "@${allReels.username}",
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
          color: AppColors.kSurfaceColor,
        ),
      ),
    );
  }
}
