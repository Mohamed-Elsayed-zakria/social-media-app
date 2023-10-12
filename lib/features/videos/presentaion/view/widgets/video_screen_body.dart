import '../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'video_screen_custom_appbar.dart';

class VideoScreenBody extends StatelessWidget {
  const VideoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const VideoScreenCustomAppbar(),
        CustomPost(
          vedioPage: true,
          future: getPostsOfTypeVideos(),
        ),
      ],
    );
  }
}
