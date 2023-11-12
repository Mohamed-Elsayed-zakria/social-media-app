import '../../../../controller/show_reels_comments_controller.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class ShowReelsCommentAddLike extends StatelessWidget {
  final CommentModel commentData;
  final String reelsUid;

  const ShowReelsCommentAddLike({
    super.key,
    required this.commentData,
    required this.reelsUid,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getReelsCommentsLikes(
        reelUid: reelsUid,
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
                    ? removeReelsLikeFromComment(
                        commentUid: commentData.commentId,
                        reelUid: reelsUid,
                      )
                    : addReelsLikeComment(
                        commentUid: commentData.commentId,
                        reelUid: reelsUid,
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
                fontSize: AppStyle.kTextStyle14,
              ),
            ),
          ],
        );
      },
    );
  }
}
