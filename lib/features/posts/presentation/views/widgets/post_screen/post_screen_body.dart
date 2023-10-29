import 'post_screen_header_loading.dart';
import 'package:flutter/material.dart';
import 'post_screen_description.dart';
import 'post_screen_header.dart';
import 'post_screen_images.dart';
import 'post_screen_lower.dart';
import 'post_screen_video.dart';

class PostScreenBody extends StatelessWidget {
  const PostScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            children: const [
              PostScreenHeaderLoading(),
              PostScreenHeader(),
              PostScreenDescription(),
              PostScreenVideo(),
              PostScreenImages(),
            ],
          ),
        ),
        const PostScreenLower(),
      ],
    );
  }
}
