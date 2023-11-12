import '../../../../core/widgets/comments/comment_uploade_image_show.dart';
import '../../data/repository/api/show_reels_comments_api.dart';
import '../../../../core/model/comment_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

TextEditingController addReelsComment = TextEditingController();
TextEditingController getTextReelsComment = TextEditingController();

File? reelsCommentImgPath;

Future<void> reelsCommentUploadImage({
  required CommentType commentType,
  required String reelUid,
  required String text,
}) async {
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    reelsCommentImgPath = File(pickedImg.path);
    Get.to(
      () => CommentUploadeImageShow(
        imageUrl: reelsCommentImgPath!.path,
        onTapSendImage: () {
          Get.back();
          addNewReelsComment(
            commentType: commentType,
            text: text,
            reelUid: reelUid,
          );
        },
      ),
    );
  }
}

Stream<List<CommentModel>> getAllReelsComments({required String reelUid}) {
  return ShowReelsCommentsApi().getAllReelsComments(reelUid: reelUid);
}

Future<void> addNewReelsComment({
  required CommentType commentType,
  required String reelUid,
  required String text,
}) async {
  await ShowReelsCommentsApi().addNewReelsComment(
    reelUid: reelUid,
    text: text,
    commentType: commentType,
  );
}

Stream<List> getReelsCommentsLikes({
  required String reelUid,
  required String commentUid,
}) {
  return ShowReelsCommentsApi().getReelsCommentsLikes(
    reelUid: reelUid,
    commentUid: commentUid,
  );
}

Future<void> addReelsLikeComment({
  required String reelUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().addReelsLikeComment(
    reelUid: reelUid,
    commentUid: commentUid,
  );
}

Future<void> removeReelsLikeFromComment({
  required String reelUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().removeReelsLikeFromComment(
    reelUid: reelUid,
    commentUid: commentUid,
  );
}

Future<void> deleteReelsComment({
  required String reelUid,
  required String commentUid,
}) async {
  await ShowReelsCommentsApi().deleteReelsComment(
    reelUid: reelUid,
    commentUid: commentUid,
  );
}

Future<void> updateReelsComment({
  required String newTextComment,
  required String commentUid,
  required String reelUid,
}) async {
  await ShowReelsCommentsApi().updateReelsComment(
    newTextComment: newTextComment,
    commentUid: commentUid,
    reelUid: reelUid,
  );
}

Future<void> reportReelsComment({
  required CommentModel commentData,
  required String reelUid,
}) async {
  await ShowReelsCommentsApi().reportReelsComment(
    commentData: commentData,
    reelUid: reelUid,
  );
}
