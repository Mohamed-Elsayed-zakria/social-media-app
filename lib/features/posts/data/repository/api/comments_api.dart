import '../../../../../core/constant/collections.dart';
import '../../../presentation/controllers/comments_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../../model/comment_model.dart';
import 'package:uuid/uuid.dart';
import '../comments_repo.dart';
import 'package:get/get.dart';

class CommentsApi extends CommentsRepo {
  @override
  Future<void> addNewComment({
    required String postId,
    required String text,
  }) async {
    String commentId = const Uuid().v1();

    String currentUsername = await ApiService.getCurrentUsername();

    CommentModel newComment = CommentModel(
      username: currentUsername,
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
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllComments({
    required String postId,
  }) {
    return ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.commentsCollection)
        .orderBy("dataPublished", descending: false)
        .snapshots();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataToComments({
    required String personUid,
  }) {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(personUid)
        .get();
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
}
