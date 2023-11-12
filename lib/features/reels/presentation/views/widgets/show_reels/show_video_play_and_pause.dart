import '../../../controller/show_reels_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowVideoPlayAndPause extends StatelessWidget {
  const ShowVideoPlayAndPause({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Obx(
      () => Visibility(
        visible: showVideoIsShowIcon.value,
        child: Center(
          child: Icon(
            showVideoIsPlaying.value ? Icons.play_arrow : Icons.pause,
            color: AppColors.kBackgroundColor,
            size: size.width * .24,
          ),
        ),
      ),
    );
  }
}
