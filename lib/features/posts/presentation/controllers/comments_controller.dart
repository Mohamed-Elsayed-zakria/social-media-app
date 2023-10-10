import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repository/api/comments_api.dart';
import 'package:flutter/material.dart';

TextEditingController commentController = TextEditingController();

Future<void> addNewComment({
  required String postId,
  required String text,
}) async {
  CommentsApi().addNewComment(postId: postId, text: text);
}

Stream<QuerySnapshot<Map<String, dynamic>>> getAllComments({
  required String postId,
}) {
  return CommentsApi().getAllComments(postId: postId);
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

Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataToComments({
  required String personUid,
}) {
  return CommentsApi().getUserDataToComments(personUid: personUid);
}

