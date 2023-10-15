import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/model/comment_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class CommentAddLike extends StatelessWidget {
  final CommentModel commentData;
  final String postUid;

  const CommentAddLike({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              commentData.likes.contains(
                ApiService.user.uid,
              )
                  ? removeLikeFromComment(
                      commentUid: commentData.commentId,
                      postUid: postUid,
                    )
                  : addLikeComment(
                      commentUid: commentData.commentId,
                      postUid: postUid,
                    );
            },
            child: commentData.likes.contains(
              ApiService.user.uid,
            )
                ? const Icon(
                    IconlyBold.heart,
                    size: 22,
                    color: AppColors.kPrimaryColor,
                  )
                : const Icon(
                    IconlyBroken.heart,
                    size: 22,
                  ),
          ),
        ),
        Text(commentData.likes.length.toString()),
      ],
    );
  }
}
