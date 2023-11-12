import '../../../../../../../core/widgets/comments/comment_circle_avatar.dart';
import '../../../../../../../core/widgets/comments/comment_of_type_image.dart';
import '../../../../../../../core/widgets/comments/comment_of_type_text.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/utils/date_time.dart';
import '../../../../../../../core/constant/colors.dart';
import 'show_reels_comment_add_like.dart';
import 'package:flutter/material.dart';
import 'show_reels_on_long_press_comment.dart';
import 'package:get/get.dart';

class ShowReelsCommentItem extends StatelessWidget {
  final CommentModel commentData;
  final String reelUid;

  const ShowReelsCommentItem({
    super.key,
    required this.commentData,
    required this.reelUid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Get.bottomSheet(
          ShowReelsOnLongPressComment(
            commentData: commentData,
            reelUid: reelUid,
          ),
        );
      },
      child: Card(
        color: AppColors.kSurfaceColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    textDirection: TextDirection.ltr,
                    '@${commentData.username}',
                  ),
                  const SizedBox(width: 5),
                  Visibility(
                    visible: commentData.verified,
                    child: const Icon(
                      Icons.verified,
                      size: 17,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    textDirection: TextDirection.ltr,
                    MyDateUtil.convertDateTime(
                      historyAsText: commentData.dataPublished,
                    ),
                  ),
                ],
              ),
              leading: CommentCircleAvatar(commentData: commentData),
              trailing: ShowReelsCommentAddLike(
                commentData: commentData,
                reelsUid: reelUid,
              ),
            ),
            Visibility(
              visible: commentData.commentType == CommentType.text.name,
              replacement: CommentOfTypeImage(
                urlImage: commentData.imageUrlComment,
              ),
              child: CommentOfTypeText(commentData: commentData),
            ),
          ],
        ),
      ),
    );
  }
}
