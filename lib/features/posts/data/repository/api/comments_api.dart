import '../../../presentation/controllers/comments_controller.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../../model/comment_model.dart';
import 'package:uuid/uuid.dart';
import '../comments_repo.dart';
import 'package:get/get.dart';
import 'dart:async';

class CommentsApi extends CommentsRepo {
  @override
  Stream<List<CommentModel>> getAllComments({required String postId}) {
    final StreamController<List<CommentModel>> commentsController =
        StreamController<List<CommentModel>>();

    ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.commentsCollection)
        .orderBy("dataPublished", descending: false)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) async {
      List<CommentModel> commentList = [];

      for (var doc in querySnapshot.docs) {
        var commentData = doc.data();
        var userUid = commentData['personUid'];

        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
            .doc(userUid)
            .get();

        if (userDataDoc.exists) {
          Map<String, dynamic>? userData = userDataDoc.data();
          commentData.addAll(userData!);
          CommentModel commentModel = CommentModel.fromJson(commentData);
          commentList.add(commentModel);
        }
      }

      commentsController.add(commentList);
    });

    return commentsController.stream;
  }

  @override
  Future<void> addNewComment({
    required String postId,
    required String text,
  }) async {
    String commentId = const Uuid().v1();

    CommentModel newComment = CommentModel(
      personUid: ApiService.user.uid,
      dataPublished: DateTime.timestamp().toString(),
      textComment: text,
      likes: [],
      commentId: commentId,
    );
    commentController.clear();

    try {
      await ApiService.firestore
          .collection(Collections.postCollection)
          .doc(postId)
          .collection(Collections.commentsCollection)
          .doc(commentId)
          .set(newComment.toJson());
    } catch (e) {
      Get.snackbar(
        "error".tr,
        "$e".tr,
        backgroundColor: AppColors.kErrorColor,
        colorText: AppColors.kSurfaceColor,
      );
    }
  }

  @override
  Future<void> addLikeComment({
    required String postUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .update({
      "likes": FieldValue.arrayUnion([ApiService.user.uid])
    });
  }

  @override
  Future<void> removeLikeFromComment({
    required String postUid,
    required String commentUid,
  }) async {
    return await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .update({
      "likes": FieldValue.arrayRemove([ApiService.user.uid])
    });
  }

  @override
  Future<void> deleteComment({
    required String postUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .delete();
  }

  @override
  Future<void> updateComment({
    required String newTextComment,
    required String commentUid,
    required String postUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .update({'textComment': newTextComment});
  }

  @override
  Future<void> reportComment({
    required CommentModel commentData,
    required String postUid,
  }) async {
    Map<String, dynamic> additionalData = {
      'idMakeReport': ApiService.user.uid,
      'postUid': postUid,
    };

    Map<String, dynamic> dataToUpdate = commentData.toJson();
    dataToUpdate.addAll(additionalData);

    ApiService.firestore
        .collection(Collections.reportCommentCollection)
        .add(dataToUpdate);
  }
}
