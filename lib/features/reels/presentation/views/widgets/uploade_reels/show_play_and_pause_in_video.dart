import '../../../controller/uploade_reels_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPlayAndPauseInVideo extends StatelessWidget {
  const ShowPlayAndPauseInVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Obx(
      () => Visibility(
        visible: isShow.value,
        child: Center(
          child: Icon(
            isPlaying.value ? Icons.play_arrow : Icons.pause,
            color: AppColors.kBackgroundColor,
            size: size.width * .24,
          ),
        ),
      ),
    );
  }
}
