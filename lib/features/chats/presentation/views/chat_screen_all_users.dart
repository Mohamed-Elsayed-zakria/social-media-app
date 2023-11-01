import 'widgets/all_users_screen/chat_screen_all_users_body.dart';
import '../../../search/presentation/view/search_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
            icon: const Icon(IconlyBroken.search),
          ),
        ],
      ),
      body: const ChatScreenBody(),
    );
  }
}
