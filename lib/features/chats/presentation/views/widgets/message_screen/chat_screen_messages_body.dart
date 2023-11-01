import '../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/models/message_model.dart';
import 'custom_lower_sent_message.dart';
import 'package:flutter/material.dart';
import 'custom_message/custom_current_message.dart';
import 'custom_message/custom_other_message.dart';
import 'package:get/get.dart';

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
                      reverse: true,
                      itemCount: messageData.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          messageData[index].senderId == ApiService.user.uid
                              ? CustomCurrentMessage(
                                  messageData: messageData[index],
                                )
                              : CustomOtherMessage(
                                  messageData: messageData[index],
                                ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Say hi".tr,
                      style: const TextStyle(
                        fontSize: AppStyle.kTextStyle18,
                      ),
                    ),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        userData.listBlock.contains(ApiService.user.uid)
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "You can not message this person".tr,
                  style: const TextStyle(
                    fontSize: AppStyle.kTextStyle16,
                  ),
                ),
              )
            : CustomLowerSentMessage(userData: userData),
      ],
    );
  }
}
