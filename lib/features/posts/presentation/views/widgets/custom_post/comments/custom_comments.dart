import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/model/comment_model.dart';
import 'package:flash/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'comments_not_fount.dart';
import 'comment_item.dart';

class CustomComments extends StatelessWidget {
  final String postId;
  const CustomComments({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.kSurfaceColor,
      child: StreamBuilder(
        stream: getAllComments(postId: postId),
        builder: (context, commentSnapshot) {
          if (commentSnapshot.hasData) {
            List<CommentModel> commentsList = commentSnapshot.data!;
            if (commentsList.isNotEmpty) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: commentsList.length,
                itemBuilder: (context, index) {
                  return CommentItem(
                    commentData: commentsList[index],
                    postUid: postId,
                  );
                },
              );
            } else {
              return const CommentsNotFount();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
