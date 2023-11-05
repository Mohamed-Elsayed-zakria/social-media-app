import 'widgets/uploade_reels/show_play_and_pause_in_video.dart';
import 'widgets/uploade_reels/buttom_goto_add_details_reels.dart';
import '../controller/uploade_reels_controller.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class UploadeReelsScreen extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;
  const UploadeReelsScreen({
    super.key,
    required this.playerControllerPlay,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kOnSurfaceColor,
        body: GestureDetector(
          onTap: () => playAndPauseVideo(
            playerControllerPlay: playerControllerPlay,
          ),
          child: Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: playerControllerPlay.value.aspectRatio,
                  child: VideoPlayer(playerControllerPlay),
                ),
              ),
              const ShowPlayAndPauseInVideo(),
              Positioned(
                bottom: 20,
                child: ButtomGotoAddDetailsReels(
                  playerControllerPlay: playerControllerPlay,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
