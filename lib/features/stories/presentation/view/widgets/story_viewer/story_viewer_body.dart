import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash/core/constant/colors.dart';
import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../posts/presentation/views/widgets/custom_post/custom_post_image_shimmer.dart';
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
              fit: BoxFit.fill,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              placeholder: (context, url) => const CustomPostImageShimmer(),
              errorWidget: (context, url, error) => SizedBox(
                width: double.infinity,
                child:  Center(
                  child: Text('Failed to load image'.tr),
                ),
              ),
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
