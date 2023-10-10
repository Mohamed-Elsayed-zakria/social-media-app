import '../../../../data/model/stories_model.dart';
import 'uploade_story_custom_take_descreption.dart';
import 'package:video_player/video_player.dart';
import 'uploade_story_custom_header.dart';
import 'uploade_story_buttom_sent.dart';
import 'package:flutter/material.dart';
import 'uploade_story_show_image.dart';
import 'uploade_story_show_vedio.dart';

class UploadeStoryBody extends StatelessWidget {
  final VideoPlayerController? playerControllerPlay;
  final String? imagePathStory;
  final TypeStoryUploade type;

  const UploadeStoryBody({
    super.key,
    this.playerControllerPlay,
    required this.type,
    this.imagePathStory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UploadeStoryCustomHeader(),
            UploadeStoryCustomTakeDescreption(type: type),
            UploadeStoryShowImage(
              imagePathStory: imagePathStory,
              type: type,
            ),
            UploadeStoryShowVedio(
              playerControllerPlay: playerControllerPlay,
              type: type,
            ),
            UploadeStoryButtomSent(
              imagePathStory: imagePathStory,
              type: type,
            ),
          ],
        ),
      ),
    );
  }
}
