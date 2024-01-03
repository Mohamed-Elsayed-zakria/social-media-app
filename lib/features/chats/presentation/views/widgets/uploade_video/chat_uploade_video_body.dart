import '../../../controllers/chat_screen_messages_controller.dart';
import '../../../controllers/chat_uploade_video_controller.dart';
import '../../../../data/models/user_chat_data.dart';
import 'package:video_player/video_player.dart';
import '../chat_custom_icon_buttom_close.dart';
import 'chat_show_video_play_and_pause.dart';
import 'package:flutter/material.dart';
import '../chat_uploade_lower.dart';
import 'package:get/get.dart';

class ChatUploadeVideoBody extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;
  final UserChatData userData;

  const ChatUploadeVideoBody({
    super.key,
    required this.playerControllerPlay,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ChatCustomIconButtomClose(),
        GestureDetector(
          onTap: () => chatShowVideoPlayAndPauseVideo(
            playerControllerPlay: playerControllerPlay,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: AspectRatio(
                  aspectRatio: playerControllerPlay.value.aspectRatio,
                  child: VideoPlayer(playerControllerPlay),
                ),
              ),
              const ChatShowVideoPlayAndPause(),
            ],
          ),
        ),
        ChatUploadeLower(
          userData: userData,
          onPressed: () {
            Get.back();
            if (addVideoChatPath != null) {
              playerControllerPlay.pause();
              sentNewMessageOfTypeVideo(userData: userData);
            }
          },
        ),
      ],
    );
  }
}
