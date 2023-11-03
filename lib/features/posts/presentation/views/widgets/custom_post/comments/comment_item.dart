import '../../../../../../../core/utils/date_time.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/model/comment_model.dart';
import 'on_long_press_current_comment.dart';
import 'on_long_press_other_comment.dart';
import 'package:flutter/material.dart';
import 'comment_circle_avatar.dart';
import 'comment_description.dart';
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
          commentData.personUid == ApiService.user.uid
              ? OnLongPressCurrentComment(
                  commentData: commentData,
                  postUid: postUid,
                )
              : OnLongPressOtherComment(
                  commentData: commentData,
                  postUid: postUid,
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
              trailing: CommentAddLike(
                commentData: commentData,
                postUid: postUid,
              ),
            ),
            CommentDescription(commentData: commentData)
          ],
        ),
      ),
    );
  }
}
