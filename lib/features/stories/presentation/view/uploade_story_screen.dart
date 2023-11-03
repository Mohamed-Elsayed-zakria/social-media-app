import 'widgets/uploade_story/uploade_story_body.dart';
import 'package:video_player/video_player.dart';
import '../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/uploade_story/uploade_story_buttom_sent.dart';

class UploadeStoryScreen extends StatelessWidget {
  final VideoPlayerController? playerControllerPlay;
  final String? imagePathStory;
  final TypeStoryUploade type;
  final int durationTime;

  const UploadeStoryScreen({
    super.key,
    this.imagePathStory,
    this.playerControllerPlay,
    required this.type,
    required this.durationTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add story'.tr),
        actions: [
          UploadeStoryButtomSent(
            imagePathStory: imagePathStory,
            durationTime: durationTime,
            type: type,
          ),
        ],
      ),
      body: UploadeStoryBody(
        playerControllerPlay: playerControllerPlay,
        durationTime: durationTime,
        imagePathStory: imagePathStory,
        type: type,
      ),
    );
  }
}
