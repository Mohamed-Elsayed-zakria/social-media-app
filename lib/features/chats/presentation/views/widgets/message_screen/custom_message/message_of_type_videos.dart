import '../../../../../../../core/utils/size_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class MessageOfTypeVideos extends StatefulWidget {
  final String videoUrl;

  const MessageOfTypeVideos({
    super.key,
    required this.videoUrl,
  });

  @override
  State<MessageOfTypeVideos> createState() => _MessageOfTypeVideosState();
}

class _MessageOfTypeVideosState extends State<MessageOfTypeVideos> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl))
      ..initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: size.width * .7,
          child: AspectRatio(
            aspectRatio: 4 / 4,
            child: Chewie(
              controller: ChewieController(
                videoPlayerController: videoPlayerController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
