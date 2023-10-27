import '../../../../controller/show_reels_comments_controller.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class ShowReelsCommentAddLike extends StatelessWidget {
  final CommentModel commentData;
  final String videoUid;

  const ShowReelsCommentAddLike({
    super.key,
    required this.commentData,
    required this.videoUid,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getReelsCommentsLikes(
        videoUid: videoUid,
        commentUid: commentData.commentId,
      ),
      builder: (context, likesSnapshot) {
        List allLikes = [];
        if (likesSnapshot.hasData) {
          allLikes = likesSnapshot.data!;
        }
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  allLikes.contains(ApiService.user.uid)
                      ? removeReelsLikeFromComment(
                          commentUid: commentData.commentId,
                          videoUid: videoUid,
                        )
                      : addReelsLikeComment(
                          commentUid: commentData.commentId,
                          videoUid: videoUid,
                        );
                },
                child: allLikes.contains(ApiService.user.uid)
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
            Text('${allLikes.length}'),
          ],
        );
      },
    );
  }
}
