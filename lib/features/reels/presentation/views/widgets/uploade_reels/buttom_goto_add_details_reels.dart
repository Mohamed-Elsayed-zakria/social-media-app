import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../core/constant/constant.dart';
import 'package:video_player/video_player.dart';
import '../../add_details_reels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomGotoAddDetailsReels extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;
  const ButtomGotoAddDetailsReels({
    super.key,
    required this.playerControllerPlay,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width * .30,
      child: CustomButton(
        onPressed: () {
          playerControllerPlay.pause();
          Get.off(
            () => AddDetailsReels(
              playerControllerPlay: playerControllerPlay,
            ),
          );
        },
        text: 'Next'.tr,
      ),
    );
  }
}
