import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../controller/show_video_reels_controller.dart';

class ShowVideoPlayAndPause extends StatelessWidget {
  const ShowVideoPlayAndPause({super.key});

  @override
  Widget build(BuildContext context) {
   final size = Constant.sizeScreen(context: context);
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

