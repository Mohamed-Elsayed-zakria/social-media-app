import '../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../controllers/chat_screen_all_users_controller.dart';
import '../../../../data/models/user_chat_data.dart';
import 'custom_list_tile_personal_user.dart';
import 'package:flutter/material.dart';
import 'no_messages_yet.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserDataToChat(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              CustomPersonaListTileShimmer(),
              CustomPersonaListTileShimmer(),
            ],
          );
        } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
          return const NoMessagesYet();
        } else {
          List<UserChatData> userData = snapshot.data!;
          return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) => CustomListTilePersonalUser(
              userData: userData[index],
            ),
          );
        }
      },
    );
  }
}
