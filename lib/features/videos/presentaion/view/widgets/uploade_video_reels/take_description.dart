import '../../../controller/uploade_video_reels_controller.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeDescription extends StatelessWidget {
  const TakeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

    return Container(
      width: size.width * .9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: getDescriptionReels,
        style: const TextStyle(
          color: AppColors.kSurfaceColor,
        ),
        decoration: InputDecoration(
          hintText: 'Write a description'.tr,
          hintStyle: const TextStyle(
            color: AppColors.kSurfaceColor,
          ),
        ),
      ),
    );
  }
}
