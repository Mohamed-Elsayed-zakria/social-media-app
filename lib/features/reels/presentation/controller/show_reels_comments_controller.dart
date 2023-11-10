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
  required String videoUid,
  required String text,
}) async {
  Get.back();
  final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImg != null) {
    reelsCommentImgPath = File(pickedImg.path);
    Get.to(
      () => CommentUploadeImageShow(
        imageUrl: reelsCommentImgPath!.path,
        onTapSendImage: () => addNewReelsComment(
          commentType: commentType,
          text: text,
          videoUid: videoUid,
        ),
      ),
    );
  }
}

Stream<List<CommentModel>> getAllReelsComments({required String videoUid}) {
  return ShowReelsCommentsApi().getAllReelsComments(videoUid: videoUid);
}

Future<void> addNewReelsComment({
  required CommentType commentType,
  required String videoUid,
  required String text,
}) async {
  await ShowReelsCommentsApi().addNewReelsComment(
    videoUid: videoUid,
    text: text,
    commentType: commentType,
  );
}

Stream<List> getReelsCommentsLikes({
  required String videoUid,
  required String commentUid,
}) {
  return ShowReelsCommentsApi().getReelsCommentsLikes(
    videoUid: videoUid,
    commentUid: commentUid,
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
