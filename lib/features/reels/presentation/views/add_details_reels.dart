import 'widgets/uploade_reels/video_reels_drop_down_menu.dart';
import '../controller/uploade_video_reels_controller.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => uploadeReelsIsLoading.value
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            width: size.width * .30,
                            child: CustomButton(
                              text: 'Share'.tr,
                              onPressed: () => uploadeVideoReels(
                                description: getDescriptionReels?.text,
                                postStatus: selectItem.value,
                              ),
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
