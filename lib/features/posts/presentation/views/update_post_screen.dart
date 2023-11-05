import 'widgets/update_post/uplate_post_header_loading.dart';
import 'widgets/update_post/update_post_buttom_share.dart';
import 'widgets/update_post/update_post_description.dart';
import 'widgets/post_screen/post_screen_header.dart';
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
      body: Column(
        children: [
          const UpdatePostHeaderLoading(),
          const PostScreenHeader(),
          UpdatePostDescription(postData: postData),
        ],
      ),
    );
  }
}
