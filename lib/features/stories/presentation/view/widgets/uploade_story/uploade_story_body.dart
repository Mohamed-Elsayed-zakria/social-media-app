import '../../../../data/model/stories_model.dart';
import '../../../controller/story_controller.dart';
import 'uploade_story_custom_take_descreption.dart';
import 'package:video_player/video_player.dart';
import 'uploade_story_custom_header.dart';
import 'package:flutter/material.dart';
import 'uploade_story_show_image.dart';
import 'uploade_story_show_vedio.dart';
import 'package:get/get.dart';

class UploadeStoryBody extends StatelessWidget {
  final VideoPlayerController? playerControllerPlay;
  final String? imagePathStory;
  final TypeStoryUploade type;
  final int durationTime;

  const UploadeStoryBody({
    super.key,
    this.playerControllerPlay,
    required this.type,
    this.imagePathStory,
    required this.durationTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: uploadeStoryIsLoading.value,
                child: const LinearProgressIndicator(),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
