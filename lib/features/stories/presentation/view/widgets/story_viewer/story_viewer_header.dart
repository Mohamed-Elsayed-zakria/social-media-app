import '../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/utils/date_time.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryViewerHeader extends StatelessWidget {
  final StoriesModel storyData;

  const StoryViewerHeader({
    super.key,
    required this.storyData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 45),
      child: ListTile(
        title: Row(
          children: [
            Text(
              textDirection: TextDirection.ltr,
              '@${storyData.username}',
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
                color: AppColors.kSurfaceColor,
              ),
            ),
            const SizedBox(width: 5),
            Visibility(
              visible: storyData.verified,
              child: const Icon(
                Icons.verified,
                size: 17,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              textDirection: TextDirection.ltr,
              MyDateUtil.convertDateTime(historyAsText: storyData.datePublish),
              style: const TextStyle(
                color: AppColors.kSurfaceColor,
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () => Get.to(
            () => ProfileScreen(otherUid: storyData.personUid),
          ),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kBackgroundColor,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage: CachedNetworkImageProvider(
                storyData.personalPicture,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
