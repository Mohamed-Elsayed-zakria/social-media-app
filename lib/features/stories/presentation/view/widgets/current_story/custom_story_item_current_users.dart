import '../../story_screen_viewer_current_users.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/stories_model.dart';
import '../custom_story_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStoryItemCurrentUsers extends StatelessWidget {
  final List<StoriesModel> stories;

  const CustomStoryItemCurrentUsers({
    super.key,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return InkWell(
      onTap: () => Get.to(
        () => StoryScreenViewerCurrentUsers(storyDatabasic: stories),
      ),
      child: SizedBox(
        width: size.width * .24,
        child: Column(
          children: [
            CustomStoryCircleAvatar(
              personalPicture: stories[0].personalPicture,
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                text: 'My status'.tr,
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
