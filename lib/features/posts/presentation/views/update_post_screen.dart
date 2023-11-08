import 'widgets/update_post/update_post_screen_body.dart';
import 'widgets/update_post/update_post_buttom_share.dart';
import '../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePostScreen extends StatelessWidget {
  final PostModel postData;
  const UpdatePostScreen({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('update post'.tr),
        actions: [
          UpdatePostButtomShare(postData: postData),
        ],
      ),
      body: UpdatePostScreenBody(postData: postData),
    );
  }
}
