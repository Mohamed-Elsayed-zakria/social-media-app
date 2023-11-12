import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/model/stories_model.dart';
import '../../../controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLongCurrentStory extends StatelessWidget {
  final StoriesModel storyData;

  const OnLongCurrentStory({
    super.key,
    required this.storyData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () {
            Get.back();
            deleteStory(storyUid: storyData.storyUid);
          },
          title: Text('Delete'.tr),
          leading: const Icon(
            color: AppColors.kPrimaryColor,
            IconlyBroken.delete,
          ),
        ),
      ),
    );
  }
}
