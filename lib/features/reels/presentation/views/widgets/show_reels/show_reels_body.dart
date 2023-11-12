import '../../../../data/model/reels_model.dart';
import '../../../../../../core/api/api_service.dart';
import 'show_reels_custom_circle_avatar.dart';
import 'show_reels_custom_comments.dart';
import 'show_reels_custom_username.dart';
import 'show_video_play_and_pause.dart';
import 'package:flutter/material.dart';
import 'show_reels_custom_likes.dart';
import 'show_reels_custom_share.dart';
import 'show_reels_description.dart';
import 'on_long_current_reels.dart';
import 'on_long_other_reels.dart';
import 'show_reels_item.dart';
import 'package:get/get.dart';

class ShowReelsBody extends StatelessWidget {
  final ReelsModel allReels;
  const ShowReelsBody({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => allReels.personUid == ApiService.user.uid
          ? Get.bottomSheet(OnLongCurrentReels(allReels: allReels))
          : Get.bottomSheet(OnLongOtherReels(allReels: allReels)),
      child: Stack(
        children: [
          ShowReelsItem(videoUrl: allReels.videoUrl),
          const ShowVideoPlayAndPause(),
          Container(
            margin: const EdgeInsets.only(right: 12, left: 12, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ShowReelsCustomCircleAvatar(allReels: allReels),
                    ShowReelsCustomLikes(allReels: allReels),
                    ShowReelsCustomComments(allReels: allReels),
                    ShowReelsCustomShare(allReels: allReels),
                  ],
                ),
                ShowReelsCustomUsername(allReels: allReels),
                ShowReelsDescription(allReels: allReels),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
