import '../../../../../../core/widgets/custom_read_more_text.dart';
import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class VideoReelsDescription extends StatelessWidget {
  final VideoReelsModel allReels;
  const VideoReelsDescription({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomReadMoreText(
        text: allReels.description ?? '',
        trimLines: 3,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
          color: AppColors.kSurfaceColor,
        ),
      ),
    );
  }
}
