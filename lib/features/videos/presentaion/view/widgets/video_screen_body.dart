import '../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreenBody extends StatelessWidget {
  const VideoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Videos'.tr),
          floating: true,
          snap: true,
        ),
        CustomPost(
          vedioPage: true,
          future: getPostsOfTypeVideos(),
        ),
      ],
    );
  }
}
