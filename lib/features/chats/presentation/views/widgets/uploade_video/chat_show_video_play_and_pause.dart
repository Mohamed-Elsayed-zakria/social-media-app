import '../../../controllers/chat_uploade_video_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatShowVideoPlayAndPause extends StatelessWidget {
  const ChatShowVideoPlayAndPause({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Obx(
      () => Visibility(
        visible: chatVideoIsShowIcon.value,
        child: Center(
          child: Icon(
            chatVideoIsShowIcon.value ? Icons.play_arrow : Icons.pause,
            color: AppColors.kBackgroundColor,
            size: size.width * .24,
          ),
        ),
      ),
    );
  }
}
