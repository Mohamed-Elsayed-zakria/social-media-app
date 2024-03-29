import '../../../../../../../core/widgets/comments/on_long_press_current_comment.dart';
import '../../../../../../../core/widgets/comments/on_long_press_other_comment.dart';
import '../../../../controller/show_reels_comments_controller.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsOnLongPressComment extends StatelessWidget {
  final CommentModel commentData;
  final String reelUid;

  const ShowReelsOnLongPressComment({
    super.key,
    required this.commentData,
    required this.reelUid,
  });

  @override
  Widget build(BuildContext context) {
    return commentData.personUid == ApiService.user.uid
        ? OnLongPressCurrentComment(
            commentController: getTextReelsComment,
            commentData: commentData,
            onTapDelete: () {
              deleteReelsComment(
                commentUid: commentData.commentId,
                reelUid: reelUid,
              );
              Get.back();
            },
            onTapEdite: () {
              if (getTextReelsComment.text.isNotEmpty) {
                Get.back();
                updateReelsComment(
                  newTextComment: getTextReelsComment.text,
                  commentUid: commentData.commentId,
                  reelUid: reelUid,
                );
              }
            },
          )
        : OnLongPressOtherComment(
            commentData: commentData,
            onTapReport: () {
              Get.back();
              reportReelsComment(
                commentData: commentData,
                reelUid: reelUid,
              );
            },
          );
  }
}
