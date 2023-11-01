import '../../../../../data/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageOfTypeVideos extends StatelessWidget {
  final MessageModel messageData;

  const MessageOfTypeVideos({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text("Videos"));
  }
}
