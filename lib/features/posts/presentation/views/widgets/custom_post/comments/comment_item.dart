import '../../../../../../../core/widgets/comments/comment_circle_avatar.dart';
import '../../../../../../../core/widgets/comments/comment_of_type_image.dart';
import '../../../../../../../core/widgets/comments/comment_of_type_text.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/utils/date_time.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/widgets/comments/comment_username.dart';
import 'on_long_press_comment.dart';
import 'comment_add_like.dart';
import 'package:get/get.dart';

class CommentItem extends StatelessWidget {
  final CommentModel commentData;
  final String postUid;

  const CommentItem({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Get.bottomSheet(
          OnLongPressComment(commentData: commentData, postUid: postUid),
        );
      },
      child: Card(
        color: AppColors.kSurfaceColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: CommentUsername(commentData: commentData),
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
              trailing: CommentAddLike(
                commentData: commentData,
                postUid: postUid,
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
