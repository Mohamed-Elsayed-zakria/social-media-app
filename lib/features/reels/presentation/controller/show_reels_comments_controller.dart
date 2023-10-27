import '../../data/repository/api/show_reels_comments_api.dart';
import '../../../../core/model/comment_model.dart';
import 'package:flutter/material.dart';

TextEditingController addReelsComment = TextEditingController();
TextEditingController getTextReelsComment = TextEditingController();

Stream<List<CommentModel>> getAllReelsComments({required String videoUid}) {
  return ShowReelsCommentsApi().getAllReelsComments(videoUid: videoUid);
}

Future<void> addNewReelsComment({
  required String videoUid,
  required String text,
}) async {
  await ShowReelsCommentsApi().addNewReelsComment(
    videoUid: videoUid,
    text: text,
  );
}

Future<void> addReelsLikeComment({
  required String videoUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().addReelsLikeComment(
    videoUid: videoUid,
    commentUid: commentUid,
  );
}

Future<void> removeReelsLikeFromComment({
  required String videoUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().removeReelsLikeFromComment(
    videoUid: videoUid,
    commentUid: commentUid,
  );
}

Future<void> deleteReelsComment({
  required String videoUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().deleteReelsComment(
    videoUid: videoUid,
    commentUid: commentUid,
  );
}

Future<void> updateReelsComment({
  required String newTextComment,
  required String commentUid,
  required String videoUid,
}) async {
  await ShowReelsCommentsApi().updateReelsComment(
    newTextComment: newTextComment,
    commentUid: commentUid,
    videoUid: videoUid,
  );
}

Future<void> reportReelsComment({
  required CommentModel commentData,
  required String videoUid,
}) async {
  await ShowReelsCommentsApi().reportReelsComment(
    commentData: commentData,
    videoUid: videoUid,
  );
}
