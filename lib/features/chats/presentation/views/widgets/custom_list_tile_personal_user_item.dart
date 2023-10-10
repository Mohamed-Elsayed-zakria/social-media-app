import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/constant/colors.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/user_chat_data.dart';
import '../chat_screen_messages.dart';
import 'package:flutter/material.dart';
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
          Text('@${userData.username}'),
          const SizedBox(width: 5),
          Visibility(
            visible: userData.verified,
            child: const Icon(
              Icons.verified,
              size: 17,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      subtitle: messages != null
          ? messages!.type == Type.text
              ? Text(messages!.message)
              : Row(
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text("Image".tr),
                  ],
                )
          : Text("No messages".tr),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(
          userData.personalPicture,
        ),
      ),
    );
  }
}
