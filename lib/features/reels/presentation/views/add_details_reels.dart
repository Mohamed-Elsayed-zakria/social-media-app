import 'package:get/get.dart';

import 'widgets/uploade_reels/video_reels_drop_down_menu.dart';
import '../controller/uploade_video_reels_controller.dart';
import 'widgets/uploade_reels/take_description.dart';
import 'package:flash/core/widgets/custom_buttom.dart';
import 'package:flash/core/constant/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class AddDetailsReels extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;

  const AddDetailsReels({
    super.key,
    required this.playerControllerPlay,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TakeDescription(),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * .4,
                    child: AspectRatio(
                      aspectRatio: 2.5 / 4,
                      child: VideoPlayer(playerControllerPlay),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .30,
                    child: CustomButton(
                      text: 'Share'.tr,
                      onPressed: () => uploadeVideoReels(
                        description: getDescriptionReels?.text,
                        postStatus: selectItem.value,
                      ),
                    ),
                  ),
                  const VideoReelsDropDownMenu(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
