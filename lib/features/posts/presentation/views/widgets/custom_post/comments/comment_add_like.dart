import '../../../../../../../core/constant/style.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
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
    return StreamBuilder(
      stream: getPostCommentsLikes(
        postUid: postUid,
        commentUid: commentData.commentId,
      ),
      builder: (context, likesSnapshot) {
        List allLikes = [];
        if (likesSnapshot.hasData) {
          allLikes = likesSnapshot.data!;
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                allLikes.contains(ApiService.user.uid)
                    ? removeLikeFromComment(
                        commentUid: commentData.commentId,
                        postUid: postUid,
                      )
                    : addLikeComment(
                        commentUid: commentData.commentId,
                        postUid: postUid,
                      );
              },
              icon: allLikes.contains(ApiService.user.uid)
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
            Text(
              '${allLikes.length}',
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
              ),
            ),
          ],
        );
      },
    );
  }
}
