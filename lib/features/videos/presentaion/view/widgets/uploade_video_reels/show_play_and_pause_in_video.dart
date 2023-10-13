import '../../../controller/uploade_video_reels_controller.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShowPlayAndPauseInVideo extends StatelessWidget {
  const ShowPlayAndPauseInVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

    return Obx(
      () => isShow.value
          ? Center(
              child: isPlaying.value
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
