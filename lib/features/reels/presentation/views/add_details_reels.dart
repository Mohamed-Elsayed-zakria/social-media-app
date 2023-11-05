import 'widgets/uploade_reels/video_reels_drop_down_menu.dart';
import '../controller/uploade_reels_controller.dart';
import '../../../../core/widgets/custom_buttom.dart';
import 'widgets/uploade_reels/take_description.dart';
import '../../../../core/utils/size_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsReels extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;

  const AddDetailsReels({
    super.key,
    required this.playerControllerPlay,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Obx(
                  () => Visibility(
                    visible: uploadeReelsIsLoading.value,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 14, bottom: 8),
                      child: LinearProgressIndicator(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TakeDescription(),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: size.width * .4,
                          child: AspectRatio(
                            aspectRatio: 2.5 / 4,
                            child: VideoPlayer(playerControllerPlay),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => SizedBox(
                      width: size.width * .30,
                      child: CustomButton(
                        text: 'Share'.tr,
                        onPressed: uploadeReelsIsLoading.value != true
                            ? () => uploadeVideoReels(
                                  description: getDescriptionReels?.text,
                                  postStatus: selectItem.value,
                                )
                            : null,
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
