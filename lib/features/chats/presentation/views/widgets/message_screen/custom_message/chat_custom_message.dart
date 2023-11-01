import '../../../../../data/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'message_of_type_images.dart';
import 'message_of_type_videos.dart';
import 'message_of_type_text.dart';

class ChatCustomMessage extends StatelessWidget {
  final MessageModel messageData;

  const ChatCustomMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return messageData.type == TypeChatMessage.text.name
        ? MessageOfTypeText(messageData: messageData)
        : messageData.type == TypeChatMessage.image.name
            ? MessageOfTypeImages(messageData: messageData)
            : MessageOfTypeVideos(messageData: messageData);
  }
}
