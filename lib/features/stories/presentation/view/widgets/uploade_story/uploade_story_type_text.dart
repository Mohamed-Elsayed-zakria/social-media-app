import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
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

    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      width: double.infinity,
      height: size.height * .5,
      color: AppColors.kPrimaryColor,
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
    );
  }
}
