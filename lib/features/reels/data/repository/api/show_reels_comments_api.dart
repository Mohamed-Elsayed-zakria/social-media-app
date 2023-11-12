import '../../../presentation/controller/show_reels_comments_controller.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/model/comment_model.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/api/api_service.dart';
import '../show_reels_comments_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:async';

class ShowReelsCommentsApi implements ShowReelsCommentsRepo {
  @override
  Stream<List<CommentModel>> getAllReelsComments({required String reelUid}) {
    final StreamController<List<CommentModel>> commentsController =
        StreamController<List<CommentModel>>();

    ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
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
  Future<void> addNewReelsComment({
    required CommentType commentType,
    required String reelUid,
    required String text,
  }) async {
    String commentId = const Uuid().v1();
    String commentImgPathUrl = '';
    if (reelsCommentImgPath != null && commentType == CommentType.image) {
      final storageRef = ApiService.fireStorage.ref(
        "reels/${ApiService.user.uid}/comments-image/$commentId/$commentId.jpg",
      );
      await storageRef.putFile(reelsCommentImgPath!);
      commentImgPathUrl = await storageRef.getDownloadURL();
    }
    CommentModel newComment = CommentModel(
      dataPublished: DateTime.timestamp().toString(),
      imageUrlComment: commentImgPathUrl,
      personUid: ApiService.user.uid,
      commentType: commentType.name,
      textComment: text,
      commentId: commentId,
    );
    addReelsComment.clear();
    try {
      await ApiService.firestore
          .collection(Collections.reelsCollection)
          .doc(reelUid)
          .collection(Collections.commentsCollection)
          .doc(commentId)
          .set(newComment.toJson())
          .then((value) {
        if (reelsCommentImgPath != null) {
          reelsCommentImgPath = null;
        }
      });
    } catch (e) {
      snackBar(
        message: '$e.'.tr,
        isError: true,
      );
    }
  }

  @override
  Stream<List> getReelsCommentsLikes({
    required String reelUid,
    required String commentUid,
  }) {
    final StreamController<List> likesController = StreamController<List>();
    ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .collection(Collections.likesCollection)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List likesData =
          querySnapshot.docs.map((doc) => doc['personUid']).toList();
      likesController.add(likesData);
    });

    return likesController.stream;
  }

  @override
  Future<void> addReelsLikeComment({
    required String reelUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .set({
      'personUid': ApiService.user.uid,
    });
  }

  @override
  Future<void> removeReelsLikeFromComment({
    required String reelUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .delete();
  }

  @override
  Future<void> deleteReelsComment({
    required String reelUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .delete();
  }

  @override
  Future<void> updateReelsComment({
    required String newTextComment,
    required String commentUid,
    required String reelUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .update({'textComment': newTextComment});
  }

  @override
  Future<void> reportReelsComment({
    required CommentModel commentData,
    required String reelUid,
  }) async {
    Map<String, dynamic> additionalData = {
      'idMakeReport': ApiService.user.uid,
      'postUid': reelUid,
    };

    Map<String, dynamic> dataToUpdate = commentData.toJson();
    dataToUpdate.addAll(additionalData);

    ApiService.firestore
        .collection(Collections.reportReelsCommentCollection)
        .add(dataToUpdate)
        .then(
          (value) => showToast(msg: "The comment has been reported".tr),
        );
  }
}
