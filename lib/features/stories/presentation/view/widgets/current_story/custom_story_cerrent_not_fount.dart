import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../../../core/utils/size_screen.dart';
import 'custom_story_current_personal_picture.dart';
import 'package:flutter/material.dart';
import '../dialog_uploade_story.dart';
import 'package:get/get.dart';

class CustomStoryCurrentNotFount extends StatelessWidget {
  const CustomStoryCurrentNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: 'uploude story'.tr,
          titlePadding: const EdgeInsets.only(top: 26, bottom: 7),
          content: const DialogUploadeStory(),
        );
      },
      child: SizedBox(
        width: size.width * .24,
        child: Column(
          children: [
            const CustomStoryCurrentPersonalPicture(),
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
