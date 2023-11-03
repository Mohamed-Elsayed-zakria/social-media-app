import '../../../../../core/constant/colors.dart';
import '../../../data/model/stories_model.dart';
import '../../controller/story_controller.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '../uploade_story_screen.dart';
import 'package:get/get.dart';

class DialogUploadeStory extends StatelessWidget {
  const DialogUploadeStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {
            Get.back();
            await imageStoryOpenGalary();
          },
          leading: const Icon(
            color: AppColors.kSecondeColor,
            IconlyBroken.image,
          ),
          title: Text('Image'.tr),
        ),
        ListTile(
          onTap: () async {
            Get.back();
            await videoStoryOpenGalary();
          },
          leading: const Icon(
            color: AppColors.kSecondeColor,
            IconlyBroken.video,
          ),
          title: Text('Video'.tr),
        ),
        ListTile(
          onTap: () async {
            Get.back();
            Get.to(
              () => const UploadeStoryScreen(
                durationTime: 10,
                type: TypeStoryUploade.text,
              ),
            );
          },
          leading: const Icon(
            color: AppColors.kSecondeColor,
            IconlyBroken.edit,
          ),
          title: Text('Text'.tr),
        ),
      ],
    );
  }
}
