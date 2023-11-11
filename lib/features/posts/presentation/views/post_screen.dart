import 'widgets/post_screen/post_screen_buttom_share.dart';
import 'widgets/post_screen/post_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'.tr),
        actions: const [
          PostScreenButtomShare(),
        ],
      ),
      body: const PostScreenBody(),
    );
  }
}
