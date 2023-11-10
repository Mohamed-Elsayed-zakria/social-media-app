import '../../../../../../../core/widgets/comments/on_long_press_current_comment.dart';
import '../../../../../../../core/widgets/comments/on_long_press_other_comment.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/utils/show_toast.dart';
import '../../../../../../../core/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OnLongPressComment extends StatelessWidget {
  final CommentModel commentData;
  final String postUid;
  const OnLongPressComment({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return commentData.personUid == ApiService.user.uid
        ? OnLongPressCurrentComment(
          commentController: getTextComment,
            onTapDelete: () {
              Get.back();
              deleteComment(
                commentUid: commentData.commentId,
                postUid: postUid,
              );
            },
            onTapEdite: () {
              if (getTextComment.text.isNotEmpty) {
                Get.back();
                updateComment(
                  newTextComment: getTextComment.text,
                  commentUid: commentData.commentId,
                  postUid: postUid,
                );
              }
            },
            commentData: commentData,
          )
        : OnLongPressOtherComment(
            onTapCopy: () {
              Get.back();
              Clipboard.setData(ClipboardData(text: commentData.textComment))
                  .then(
                (value) => showToast(msg: "The text has been copied".tr),
              );
            },
            onTapReport: () {
              Get.back();
              reportComment(
                commentData: commentData,
                postUid: postUid,
              );
            },
          );
  }
}
