import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import '../../../../../profile/presentation/views/profile_screen.dart';
import '../../../../data/model/video_reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoReelsCustomCircleAvatar extends StatelessWidget {
  final VideoReelsModel allReels;

  const VideoReelsCustomCircleAvatar({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProfileScreen(otherUid: allReels.personUid));
        },
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.kSurfaceColor,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.kSurfaceColor,
                backgroundImage: CachedNetworkImageProvider(
                  allReels.personalPicture,
                ),
              ),
            ),
            CustomVerifiedInCircalAvatar(visible: allReels.verified),
          ],
        ),
      ),
    );
  }
}
