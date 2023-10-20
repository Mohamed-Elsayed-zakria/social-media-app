import 'widgets/custom_post/likes/show_all_likes_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostShowAllLikes extends StatelessWidget {
  final String postUid;
  const CustomPostShowAllLikes({
    super.key,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
          Get.back();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Likes'.tr),
        ),
        body:  ShowAllLikesBody(postUid: postUid),
      ),
    );
  }
}
