import '../../../../../../core/widgets/comments/comments_lower.dart';
import '../../../controllers/custom_post_controller.dart';
import '../../../../../../core/model/comment_model.dart';
import '../../../controllers/comments_controller.dart';
import 'package:flutter/material.dart';
import 'comments/custom_comments.dart';
import 'package:get/get.dart';
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
        title: Text('Post details'.tr),
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
          CommentsLower(
            commentController: commentController,
            onTapSendComment: () {
              if (commentController.text.isNotEmpty) {
                addNewCommentOfTypeText(
                  text: commentController.text,
                  postId: postUid,
                );
              }
            },
            onTapSendImage: () => commentUploadImage(
              commentType: CommentType.image,
              postId: postUid,
              text: commentController.text,
            ),
          ),
        ],
      ),
    );
  }
}
