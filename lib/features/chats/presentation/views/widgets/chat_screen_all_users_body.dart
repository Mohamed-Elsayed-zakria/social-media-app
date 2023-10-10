import '../../../data/models/user_chat_data.dart';
import 'custom_list_tile_personal_user.dart';
import 'package:flutter/material.dart';

class ChatScreenBody extends StatelessWidget {
  final List<UserChatData> userData;
  const ChatScreenBody({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userData.length,
      itemBuilder: (context, index) => CustomListTilePersonalUser(
        userData: userData[index],
      ),
    );
  }
}
