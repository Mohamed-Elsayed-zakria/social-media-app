import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class VideoReelsCustomShare extends StatelessWidget {
  final VideoReelsModel allReels;

  const VideoReelsCustomShare({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share(
          allReels.postUrl,
          subject: allReels.description,
        );
      },
      icon: const Icon(
        IconlyBroken.send,
        size: 35,
        color: AppColors.kSurfaceColor,
      ),
    );
  }
}
