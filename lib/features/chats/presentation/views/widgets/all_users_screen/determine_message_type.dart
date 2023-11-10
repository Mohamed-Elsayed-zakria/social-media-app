import '../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetermineTheMessageType extends StatelessWidget {
  final MessageModel? messages;

  const DetermineTheMessageType({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return messages != null
        ? messages!.type == TypeChatMessage.text.name
            ? Text(
                messages!.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            : messages!.type == TypeChatMessage.image.name
                ? Row(
                    children: [
                      const Icon(
                        Icons.image_outlined,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text("Image".tr),
                    ],
                  )
                : Row(
                    children: [
                      const Icon(
                        Icons.video_collection_outlined,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text("Video".tr),
                    ],
                  )
        : Text("No messages".tr);
  }
}
