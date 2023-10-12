import '../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreenCustomHeader extends StatelessWidget {
  final UserChatData userData;

  const MessageScreenCustomHeader({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => Get.to(
        () => ProfileScreen(otherUid: userData.personUid),
      ),
      title: Row(
        children: [
          Text(
            '@${userData.username}',
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
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
      subtitle: Text(
        userData.isOnline ? "Online".tr : "Ofline".tr,
        style: const TextStyle(fontSize: AppStyle.kTextStyle16),
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(
          userData.personalPicture,
        ),
      ),
    );
  }
}
