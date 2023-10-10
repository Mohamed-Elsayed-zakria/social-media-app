import '../../../controllers/custom_post_controller.dart';
import 'package:flutter/material.dart';
import 'comments/custom_comments.dart';
import 'comments/comments_lower.dart';
import 'custom_post.dart';

class CustomPostDetails extends StatelessWidget {
  final String postUid;
  const CustomPostDetails({
    super.key,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                CustomPost(
                  detailsPage: true,
                  future: getPostDetails(postId: postUid),
                ),
                const Divider(),
                CustomComments(
                  postId: postUid,
                ),
              ],
            ),
          ),
          CommentsLower(postId: postUid),
        ],
      ),
    );
  }
}
