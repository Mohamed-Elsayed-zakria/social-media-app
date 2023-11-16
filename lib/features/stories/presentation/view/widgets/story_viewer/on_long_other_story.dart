import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/model/stories_model.dart';
import '../../../controller/uploade_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLongOtherStory extends StatelessWidget {
  final StoriesModel storyData;

  const OnLongOtherStory({
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
            reportStory(storyData: storyData);
          },
          title: Text("Report".tr),
          leading: const Icon(
            IconlyBroken.infoSquare,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
