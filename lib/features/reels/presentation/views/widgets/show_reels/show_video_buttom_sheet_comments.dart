import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'comments/show_video_comment_lower.dart';
import 'package:flutter/material.dart';

class ShowVideoButtomSheetComments extends StatelessWidget {
  final VideoReelsModel allReels;

  const ShowVideoButtomSheetComments({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Container(
      height: size.height * .75,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          ShowVideoCommentsLower(allReels: allReels),
        ],
      ),
    );
  }
}
