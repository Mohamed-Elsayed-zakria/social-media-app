import '../../data/repository/api/comments_api.dart';
import '../../data/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

TextEditingController commentController = TextEditingController();

Stream<List<CommentModel>> getAllComments({required String postId}) {
  return CommentsApi().getAllComments(postId: postId);
}

Future<void> addNewComment({
  required String postId,
  required String text,
}) async {
  CommentsApi().addNewComment(postId: postId, text: text);
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

