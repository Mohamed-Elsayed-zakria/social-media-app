import '../../../controllers/chat_screen_all_users_controller.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../data/models/message_model.dart';
import 'custom_list_tile_personal_user_item.dart';
import 'package:flutter/material.dart';

class CustomListTilePersonalUser extends StatelessWidget {
  final UserChatData userData;
  const CustomListTilePersonalUser({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    MessageModel? messages;
    return StreamBuilder(
      stream: getLastMessages(otherUserId: userData.personUid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> list = snapshot.data!;
          if (list.isNotEmpty) messages = list[0];
        }
        return Visibility(
          visible: messages != null,
          child: CustomListTilePersonalUserItem(
            userData: userData,
            messages: messages,
          ),
        );
      },
    );
  }
}
