import '../../../controller/show_reels_controller.dart';
import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class VideoReelsCustomLikes extends StatelessWidget {
  final VideoReelsModel allReels;
  const VideoReelsCustomLikes({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getReelsLikes(videoUid: allReels.videoUid),
      builder: (context, snapshot) {
        List allLikes = [];
        int countLikes = 0;
        if (snapshot.hasData) {
          allLikes = snapshot.data!;
          countLikes = allLikes.length;
        }
        return Column(
          children: [
            IconButton(
              onPressed: () {
                allLikes.contains(ApiService.user.uid)
                    ? removeLikeToReels(videoUid: allReels.videoUid)
                    : addLikeToReels(videoUid: allReels.videoUid);
              },
              icon: allLikes.contains(ApiService.user.uid)
                  ? const Icon(
                      color: AppColors.kPrimaryColor,
                      IconlyBold.heart,
                      size: 43,
                    )
                  : const Icon(
                      color: AppColors.kSurfaceColor,
                      IconlyBroken.heart,
                      size: 43,
                    ),
            ),
            Text(
              countLikes.toString(),
              style: const TextStyle(
                color: AppColors.kSurfaceColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
