import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/utils/date_time.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import 'show_reelson_long_press_current_comment.dart';
import 'show_reels_on_long_press_other_comment.dart';
import 'show_reels_comment_circal_avatar.dart';
import 'show_reels_comment_description.dart';
import 'show_reels_comment_add_like.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsCommentItem extends StatelessWidget {
  final CommentModel commentData;
  final String videoUid;

  const ShowReelsCommentItem({
    super.key,
    required this.commentData,
    required this.videoUid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Get.bottomSheet(
          commentData.personUid == ApiService.user.uid
              ? ShowReelsOnLongPressCurrentComment(
                  commentData: commentData,
                  videoUid: videoUid,
                )
              : ShowReelsOnLongPressOtherComment(
                  commentData: commentData,
                  videoUid: videoUid,
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
              subtitle: Text(
                textDirection: TextDirection.ltr,
                MyDateUtil.convertDateTime(
                  historyAsText: commentData.dataPublished,
                ),
              ),
              leading: ShowReelsCommentCircleAvatar(commentData: commentData),
              trailing: ShowReelsCommentAddLike(
                commentData: commentData,
                videoUid: videoUid,
              ),
            ),
            ShowReelsCommentDescription(commentData: commentData)
          ],
        ),
      ),
    );
  }
}
