// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../core/constant/constant.dart';
import 'video_reels_custom_circle_avatar.dart';
import 'video_reels_custom_comments.dart';
import 'video_reels_custom_likes.dart';
import 'video_reels_custom_share.dart';
import 'video_reels_custom_username.dart';
import 'video_reels_description.dart';

class VideoReelsBody extends StatelessWidget {
  const VideoReelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

    return Stack(
      children: [
        Positioned(
          bottom: size.height * 0.10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoReelsCustomCircleAvatar(),
                const SizedBox(height: 12),
                VideoReelsCustomLikes(),
                const SizedBox(height: 12),
                VideoReelsCustomComments(),
                const SizedBox(height: 12),
                VideoReelsCustomShare(),
                const SizedBox(height: 12),
                VideoReelsCustomUsername(),
              ],
            ),
          ),
        ),
        VideoReelsDescription(description: 'hello world '),
      ],
    );
  }
}
