import '../../../../../../core/utils/size_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class StoryViewerPlayVedio extends StatefulWidget {
  final String videoUrl;
  const StoryViewerPlayVedio({
    super.key,
    required this.videoUrl,
  });

  @override
  State<StoryViewerPlayVedio> createState() => _CustomPostVedioItemState();
}

class _CustomPostVedioItemState extends State<StoryViewerPlayVedio> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
            videoPlayerController.play();
            videoPlayerController.setVolume(1);
          });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return LimitedBox(
      maxHeight: size.height * 0.6,
      child: InkWell(
        onTap: () {
          videoPlayerController.value.isPlaying
              ? videoPlayerController.pause()
              : videoPlayerController.play();
        },
        child: VideoPlayer(videoPlayerController),
      ),
    );
  }
}
