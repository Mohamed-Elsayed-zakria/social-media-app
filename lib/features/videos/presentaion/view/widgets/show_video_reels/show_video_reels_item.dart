import '../../../controller/show_video_reels_controller.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ShowVideoReelsItem extends StatefulWidget {
  final String videoUrl;

  const ShowVideoReelsItem({
    super.key,
    required this.videoUrl,
  });

  @override
  State<ShowVideoReelsItem> createState() => _ShowVideoReelsItemState();
}

class _ShowVideoReelsItemState extends State<ShowVideoReelsItem> {
late VideoPlayerController showVideoReelsController;

  @override
  void initState() {
    showVideoReelsController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
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
    final size = Constant.sizeScreen(context: context);
    return InkWell(
      onTap: () => showVideoPlayAndPauseVideo(
        playerControllerPlay: showVideoReelsController,
      ),
      child: Container(
        width: size.width,
        height: size.height,
        color: AppColors.kOnSurfaceColor,
        child: VideoPlayer(showVideoReelsController),
      ),
    );
  }
}
