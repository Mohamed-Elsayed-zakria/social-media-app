import '../../../../data/model/video_reels_model.dart';
import 'video_reels_custom_circle_avatar.dart';
import 'video_reels_custom_comments.dart';
import 'video_reels_custom_username.dart';
import 'show_video_play_and_pause.dart';
import 'package:flutter/material.dart';
import 'video_reels_custom_likes.dart';
import 'video_reels_custom_share.dart';
import 'video_reels_description.dart';
import 'show_reels_item.dart';

class ShowVideoReelsBody extends StatelessWidget {
  final VideoReelsModel allReels;
  const ShowVideoReelsBody({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  VideoReelsCustomCircleAvatar(allReels: allReels),
                  VideoReelsCustomLikes(allReels: allReels),
                  VideoReelsCustomComments(allReels: allReels),
                  VideoReelsCustomShare(allReels: allReels),
                ],
              ),
              VideoReelsCustomUsername(allReels: allReels),
              VideoReelsDescription(allReels: allReels),
            ],
          ),
        ),
      ],
    );
  }
}
