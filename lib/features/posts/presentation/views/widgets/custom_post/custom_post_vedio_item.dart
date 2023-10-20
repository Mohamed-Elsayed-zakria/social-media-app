import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../core/constant/constant.dart';

class CustomPostVedioItem extends StatefulWidget {
  final String videoUrl;
  const CustomPostVedioItem({
    super.key,
    required this.videoUrl,
  });

  @override
  State<CustomPostVedioItem> createState() => _CustomPostVedioItemState();
}

class _CustomPostVedioItemState extends State<CustomPostVedioItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return LimitedBox(
      maxHeight: size.height * 0.40,
      child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: Chewie(
          controller: ChewieController(
            videoPlayerController: videoPlayerController,
          ),
        ),
      ),
    );
  }
}
