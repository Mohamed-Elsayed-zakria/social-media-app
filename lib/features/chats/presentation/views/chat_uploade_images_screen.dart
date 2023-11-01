import 'widgets/uploade_images/chat_uploade_images_body.dart';
import '../../data/models/user_chat_data.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class ChatUploadeImagesScreen extends StatelessWidget {
  final UserChatData userData;

  const ChatUploadeImagesScreen({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: ChatUplaodeImagesBody(userData: userData),
    );
  }
}
