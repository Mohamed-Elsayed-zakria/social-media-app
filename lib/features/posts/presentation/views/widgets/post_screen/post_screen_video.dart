import '../../../../../../core/constant/constant.dart';
import '../../../controllers/post_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

class PostScreenVideo extends StatelessWidget {
  const PostScreenVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Obx(
      () => vedioPath.value != null
          ? Container(
              margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
              child: LimitedBox(
                maxHeight: size.height * 0.40,
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController: playerController!,
                    autoPlay: false,
                    looping: false,
                    allowFullScreen: false,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
