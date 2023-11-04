import '../../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../data/models/message_model.dart';
import '../../chat_screen_messages.dart';
import 'package:flutter/material.dart';
import 'determine_message_type.dart';
import 'package:get/get.dart';

class CustomListTilePersonalUserItem extends StatelessWidget {
  final UserChatData userData;
  final MessageModel? messages;

  const CustomListTilePersonalUserItem({
    super.key,
    required this.userData,
    this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(
        () => ChatScreenMessages(userData: userData),
      ),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${userData.username}',
          ),
        ],
      ),
      subtitle: DetermineTheMessageType(messages: messages),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kBackgroundColor,
            backgroundImage: CachedNetworkImageProvider(
              userData.personalPicture,
            ),
          ),
          CustomVerifiedInCircalAvatar(visible: userData.verified),
        ],
      ),
    );
  }
}
