import 'package:flutter/material.dart';
import 'show_all_likes_body.dart';
import 'package:get/get.dart';

class ShowAllLikes extends StatelessWidget {
  final List allLikes;

  const ShowAllLikes({
    super.key,
    required this.allLikes,
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
        body: ShowAllLikesBody(allLikes: allLikes),
      ),
    );
  }
}
