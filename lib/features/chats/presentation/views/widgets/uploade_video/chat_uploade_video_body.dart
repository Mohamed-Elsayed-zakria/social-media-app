import '../../../controllers/chat_screen_messages_controller.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../data/models/message_model.dart';
import 'package:video_player/video_player.dart';
import '../chat_custom_icon_buttom_close.dart';
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
      children: [
        const ChatCustomIconButtomClose(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: AspectRatio(
              aspectRatio: playerControllerPlay.value.aspectRatio,
              child: VideoPlayer(playerControllerPlay),
            ),
          ),
        ),
        ChatUploadeLower(
          userData: userData,
          onPressed: () {
            Get.back();
            sentNewMessage(
              type: TypeChatMessage.video.name,
              userData: userData,
              text: '',
            );
          },
        ),
      ],
    );
  }
}
