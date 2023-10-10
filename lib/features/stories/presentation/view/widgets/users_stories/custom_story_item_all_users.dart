import '../../../../../../core/constant/constant.dart';
import '../../../../data/model/stories_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flash/core/constant/style.dart';
import '../custom_story_circle_avatar.dart';
import 'package:flutter/material.dart';
import '../../story_screen_viewer_all_users.dart';
import 'package:get/get.dart';

class CustomStoryItemAllUsers extends StatelessWidget {
  final List<List<StoriesModel>> storyDatabasic;
  final StoriesModel firstStory;
  final int initialPage;

  const CustomStoryItemAllUsers({
    super.key,
    required this.firstStory,
    required this.initialPage,
    required this.storyDatabasic,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return InkWell(
      onTap: () => Get.to(() => StoryScreenViewerAllUsers(
            storyDatabasic: storyDatabasic,
            initialPage: initialPage,
          )),
      child: SizedBox(
        width: size.width * .24,
        child: Column(
          children: [
            CustomStoryCircleAvatar(
              personalPicture: firstStory.personalPicture
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                text: '@${firstStory.username}',
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle14,
                  color: AppColors.kOnSurfaceColor,
                ),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
