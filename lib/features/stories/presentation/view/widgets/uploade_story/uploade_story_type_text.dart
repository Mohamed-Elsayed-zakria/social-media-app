import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../../controller/uploade_story_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryTypeText extends StatelessWidget {
  const UploadeStoryTypeText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);

    return GetBuilder<UploadeStoryController>(
      init: UploadeStoryController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: IconButton(
              onPressed: () => controller.increaseCounter(),
              icon: const Icon(
                Icons.color_lens_outlined,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: size.height * .5,
            color: controller.storyColors[selectColorIndex],
            child: TextFormField(
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle18,
                color: AppColors.kSurfaceColor,
              ),
              textAlign: TextAlign.center,
              controller: getTextStory,
              maxLines: null,
              maxLength: 300,
              cursorColor: AppColors.kSurfaceColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write something'.tr,
                counterText: '',
                hintStyle: const TextStyle(
                  fontSize: AppStyle.kTextStyle20,
                  color: AppColors.kSurfaceColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
