import '../../../controller/show_reels_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ShowReelsItem extends StatefulWidget {
  final String videoUrl;

  const ShowReelsItem({
    super.key,
    required this.videoUrl,
  });

  @override
  State<ShowReelsItem> createState() => _ShowReelsItemState();
}

class _ShowReelsItemState extends State<ShowReelsItem> {
  late VideoPlayerController showVideoReelsController;

  @override
  void initState() {
    showVideoReelsController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
            setState(() {});
            showVideoReelsController.play();
            showVideoReelsController.setVolume(1);
          });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    showVideoReelsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showVideoPlayAndPauseVideo(
        playerControllerPlay: showVideoReelsController,
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: showVideoReelsController.value.aspectRatio,
          child: VideoPlayer(showVideoReelsController),
        ),
      ),
    );
  }
}
