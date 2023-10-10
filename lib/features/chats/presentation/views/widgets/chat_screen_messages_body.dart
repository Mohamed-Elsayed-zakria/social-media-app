import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/style.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/user_chat_data.dart';
import 'custom_current_message.dart';
import 'custom_lower_sent_message.dart';
import 'custom_other_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenMessagesBody extends StatelessWidget {
  final List<MessageModel> messageData;
  final UserChatData userData;
  const ChatScreenMessagesBody({
    super.key,
    required this.messageData,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          messageData.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: messageData.length,
                    reverse: true,
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
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      "Say hi".tr,
                      style: const TextStyle(
                        fontSize: AppStyle.kTextStyle18,
                      ),
                    ),
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
      ),
    );
  }
}
