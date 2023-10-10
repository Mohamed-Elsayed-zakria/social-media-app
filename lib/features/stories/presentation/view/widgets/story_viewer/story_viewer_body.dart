import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash/core/constant/colors.dart';
import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/stories_model.dart';
import 'story_viewer_play_vedio.dart';
import 'story_viewer_header.dart';
import 'story_viewer_lower.dart';

class StoryViewerBody extends StatelessWidget {
  final StoriesModel storyData;

  const StoryViewerBody({
    super.key,
    required this.storyData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storyData.type != TypeStoryUploade.text
          ? AppColors.kOnSurfaceColor
          : AppColors.kPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: storyData.imgPath!.isNotEmpty &&
                storyData.type == TypeStoryUploade.image,
            child: CachedNetworkImage(
              imageUrl: storyData.imgPath!,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Visibility(
            visible: storyData.vedioUrl!.isNotEmpty &&
                storyData.type == TypeStoryUploade.vedio,
            child: StoryViewerPlayVedio(videoUrl: storyData.vedioUrl!),
          ),
          Visibility(
            visible: storyData.type == TypeStoryUploade.text,
            child: Text(
              storyData.description!,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle20,
                color: AppColors.kSurfaceColor,
              ),
            ),
          ),
          StoryViewerHeader(storyData: storyData),
          StoryViewerLower(storyData: storyData),
        ],
      ),
    );
  }
}
