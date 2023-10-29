import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../controller/show_reels_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowVideoPlayAndPause extends StatelessWidget {
  const ShowVideoPlayAndPause({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Obx(
      () => showVideoIsShowIcon.value
          ? Center(
              child: showVideoIsPlaying.value
                  ? Icon(
                      Icons.play_arrow,
                      color: AppColors.kBackgroundColor,
                      size: size.width * .24,
                    )
                  : Icon(
                      Icons.pause,
                      color: AppColors.kBackgroundColor,
                      size: size.width * .24,
                    ),
            )
          : const SizedBox(),
    );
  }
}
