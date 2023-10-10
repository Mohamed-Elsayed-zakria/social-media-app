import '../../../../controllers/comments_controller.dart';
import '../../../../../data/model/comment_model.dart';
import 'package:flash/core/constant/colors.dart';
import 'comment_item.dart';
import 'package:flutter/material.dart';
import 'comments_not_fount.dart';

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
          List<CommentModel> commentsList;
          if (commentSnapshot.hasData) {
            final allCommentData = commentSnapshot.data?.docs;
            commentsList = allCommentData
                    ?.map(
                      (element) => CommentModel.fromJson(element.data()),
                    )
                    .toList() ??
                [];
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
