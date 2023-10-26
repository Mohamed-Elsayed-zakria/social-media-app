import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/message_model.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../chat_screen_messages.dart';
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
      title: Text(
        textDirection: TextDirection.ltr,
        '@${userData.username}',
      ),
      subtitle: messages != null
          ? messages!.type == Type.text.name
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
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kBackgroundColor,
            backgroundImage: CachedNetworkImageProvider(
              userData.personalPicture,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: userData.verified,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kSurfaceColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.verified,
                  size: 18,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
