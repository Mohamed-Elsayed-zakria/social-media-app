import '../../../../../../core/constant/constant.dart';
import '../../../../data/model/stories_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class UploadeStoryShowVedio extends StatelessWidget {
  final TypeStoryUploade type;
  final VideoPlayerController? playerControllerPlay;

  const UploadeStoryShowVedio({
    super.key,
    this.playerControllerPlay,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return playerControllerPlay != null && type == TypeStoryUploade.vedio
        ? Container(
            margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
            child: LimitedBox(
              maxHeight: size.height * 0.4,
              child: Chewie(
                controller: ChewieController(
                  videoPlayerController: playerControllerPlay!,
                  autoPlay: false,
                  looping: false,
                  allowFullScreen: false,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
