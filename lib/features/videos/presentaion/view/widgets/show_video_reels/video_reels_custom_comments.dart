import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'show_video_buttom_sheet_comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoReelsCustomComments extends StatelessWidget {
  final VideoReelsModel allReels;

  const VideoReelsCustomComments({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    int countComments = 0;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          IconButton(
            onPressed: () => Get.bottomSheet(
             ShowVideoButtomSheetComments(allReels: allReels),
              isScrollControlled: true,
            ),
            icon: const Icon(
              IconlyBroken.moreSquare,
              size: 33,
              color: AppColors.kSurfaceColor,
            ),
          ),
          Text(
            countComments.toString(),
            style: const TextStyle(
              color: AppColors.kSurfaceColor,
            ),
          ),
        ],
      ),
    );
  }
}
