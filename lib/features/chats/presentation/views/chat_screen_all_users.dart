import '../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../search/presentation/view/search_screen.dart';
import '../controllers/chat_screen_all_users_controller.dart';
import 'widgets/chat_screen_all_users_body.dart';
import '../../data/models/user_chat_data.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenAllUsers extends StatelessWidget {
  const ChatScreenAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'.tr),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: const Icon(IconBroken.Search),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getUserDataToChat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              children: [
                CustomPersonaListTileShimmer(),
                CustomPersonaListTileShimmer()
              ],
            );
          } else {
            List<UserChatData> userData = [];
            final allUserData = snapshot.data!.docs;

            userData = allUserData
                .map((element) => UserChatData.fromJson(element.data()))
                .toList();
            return ChatScreenBody(userData: userData);
          }
        },
      ),
    );
  }
}
