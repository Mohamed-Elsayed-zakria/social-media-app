import 'widgets/uploade_video_reels/show_play_and_pause_in_video.dart';
import 'widgets/uploade_video_reels/buttom_sent_data.dart';
import '../controller/uploade_video_reels_controller.dart';
import 'widgets/uploade_video_reels/take_description.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UploadeVideoReelsScreen extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;
  final File addVideoReelsPath;
  const UploadeVideoReelsScreen({
    super.key,
    required this.playerControllerPlay,
    required this.addVideoReelsPath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () => playAndPauseVideo(
            playerControllerPlay: playerControllerPlay,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(playerControllerPlay),
              const ShowPlayAndPauseInVideo(),
              Positioned(
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TakeDescription(),
                    ButtomSentData(addVideoReelsPath: addVideoReelsPath),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
