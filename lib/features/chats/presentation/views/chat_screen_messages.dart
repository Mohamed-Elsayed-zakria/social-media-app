import '../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/chat_screen_messages_controller.dart';
import 'widgets/chat_screen_messages_body.dart';
import '../../data/models/user_chat_data.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/style.dart';
import '../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenMessages extends StatelessWidget {
  final UserChatData userData;
  const ChatScreenMessages({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
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
        ),
      ),
      body: StreamBuilder(
        stream: getAllMessages(receiverId: userData.personUid),
        builder: (context, snapshot) {
          List<MessageModel> messageData = [];
          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            messageData = data
                    ?.map(
                      (element) => MessageModel.fromJson(element.data()),
                    )
                    .toList() ??
                [];
            return ChatScreenMessagesBody(
              messageData: messageData,
              userData: userData,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
