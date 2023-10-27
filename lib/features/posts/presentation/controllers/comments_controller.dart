import '../../data/repository/api/comments_api.dart';
import '../../../../core/model/comment_model.dart';
import 'package:flutter/material.dart';

TextEditingController commentController = TextEditingController();

TextEditingController getTextComment = TextEditingController();

Stream<List<CommentModel>> getAllComments({required String postId}) {
  return CommentsApi().getAllComments(postId: postId);
}

Future<void> addNewComment({
  required String postId,
  required String text,
}) async {
  CommentsApi().addNewComment(postId: postId, text: text);
}

Stream<List> getPostCommentsLikes({
  required String postUid,
  required String commentUid,
}) {
  return CommentsApi().getPostCommentsLikes(
    postUid: postUid,
    commentUid: commentUid,
  );
}

Future<void> addLikeComment({
  required String postUid,
  required String commentUid,
}) async {
  CommentsApi().addLikeComment(postUid: postUid, commentUid: commentUid);
}

Future<void> removeLikeFromComment({
  required String postUid,
  required String commentUid,
}) async {
  CommentsApi().removeLikeFromComment(postUid: postUid, commentUid: commentUid);
}

Future<void> deleteComment({
  required String postUid,
  required String commentUid,
}) async {
  CommentsApi().deleteComment(postUid: postUid, commentUid: commentUid);
}

Future<void> updateComment({
  required String newTextComment,
  required String commentUid,
  required String postUid,
}) async {
  CommentsApi().updateComment(
    newTextComment: newTextComment,
    commentUid: commentUid,
    postUid: postUid,
  );
}

Future<void> reportComment({
  required CommentModel commentData,
  required String postUid,
}) async {
  CommentsApi().reportComment(commentData: commentData, postUid: postUid);
}
