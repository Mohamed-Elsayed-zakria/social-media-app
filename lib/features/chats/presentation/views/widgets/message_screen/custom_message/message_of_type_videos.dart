import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../data/models/message_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class MessageOfTypeVideos extends StatefulWidget {
  final MessageModel messageData;

  const MessageOfTypeVideos({
    super.key,
    required this.messageData,
  });

  @override
  State<MessageOfTypeVideos> createState() => _MessageOfTypeVideosState();
}

class _MessageOfTypeVideosState extends State<MessageOfTypeVideos> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.messageData.videoUrl!))
      ..initialize();
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
          width: size.width * .8,
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
