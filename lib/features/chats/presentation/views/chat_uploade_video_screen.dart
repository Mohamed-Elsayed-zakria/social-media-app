import 'widgets/uploade_video/chat_uploade_video_body.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constant/colors.dart';
import '../../data/models/user_chat_data.dart';
import 'package:flutter/material.dart';

class ChatUploadeVideoScreen extends StatelessWidget {
  final VideoPlayerController playerControllerPlay;
  final UserChatData userData;

  const ChatUploadeVideoScreen({
    super.key,
    required this.playerControllerPlay,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: ChatUploadeVideoBody(
        playerControllerPlay: playerControllerPlay,
        userData: userData,
      ),
    );
  }
}
