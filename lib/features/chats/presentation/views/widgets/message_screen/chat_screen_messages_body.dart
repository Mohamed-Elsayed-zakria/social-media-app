import '../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../core/model/current_user_data.dart';
import 'custom_message/chat_custom_message_item.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../data/models/message_model.dart';
import 'chat_current_make_block_message.dart';
import 'chat_other_make_block_message.dart';
import 'custom_lower_sent_message.dart';
import 'package:flutter/material.dart';
import 'chat_not_fount_message.dart';

class ChatScreenMessagesBody extends StatelessWidget {
  final UserChatData userData;
  const ChatScreenMessagesBody({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: getAllMessages(receiverId: userData.personUid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MessageModel> messageData = snapshot.data!;
                if (messageData.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemCount: messageData.length,
                      itemBuilder: (context, index) => ChatCustomMessage(
                        messageData: messageData[index],
                      ),
                    ),
                  );
                } else {
                  return const ChatNotFountMesssage();
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        CurrentUserData.listBlock.contains(userData.personUid)
            ? const ChatCurrentMakeBlockMessage()
            : userData.listBlock.contains(ApiService.user.uid)
                ? const ChatOtherMakeBlockMessage()
                : CustomLowerSentMessage(userData: userData),
      ],
    );
  }
}
