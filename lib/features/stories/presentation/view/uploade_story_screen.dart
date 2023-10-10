import 'widgets/uploade_story/uploade_story_body.dart';
import 'package:video_player/video_player.dart';
import '../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryScreen extends StatelessWidget {
  final TypeStoryUploade type;
  final VideoPlayerController? playerControllerPlay;
  final String? imagePathStory;

  const UploadeStoryScreen({
    super.key,
    this.imagePathStory,
    this.playerControllerPlay,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add story'.tr),
      ),
      body: UploadeStoryBody(
        playerControllerPlay: playerControllerPlay,
        imagePathStory: imagePathStory,
        type: type,
      ),
    );
  }
}
