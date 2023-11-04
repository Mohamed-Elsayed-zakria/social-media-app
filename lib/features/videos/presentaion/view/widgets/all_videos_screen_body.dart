import '../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../controller/video_controller.dart';
import 'video_screen_custom_appbar.dart';
import 'package:flutter/material.dart';

class AllVideosScreenBody extends StatelessWidget {
  const AllVideosScreenBody({super.key});

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
