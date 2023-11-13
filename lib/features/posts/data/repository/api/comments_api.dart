import '../../../presentation/controllers/comments_controller.dart';
import '../../../../../core/utils/get_current_date_time.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/model/comment_model.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/api/api_service.dart';
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
  Future<void> addNewCommentOfTypeText({
    required String postId,
    required String text,
  }) async {
    commentController.clear();
    String commentId = const Uuid().v1();
    DateTime getCurrentDateTime = currentTimeDevice();

    CommentModel newComment = CommentModel(
      dataPublished: getCurrentDateTime.toString(),
      imageUrlComment: '',
      personUid: ApiService.user.uid,
      commentType: CommentType.text.name,
      textComment: text,
      commentId: commentId,
    );

    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.commentsCollection)
        .doc(commentId)
        .set(newComment.toJson());
  }

  @override
  Future<void> addNewCommentOfTypeImage({
    required String postId,
  }) async {
    String commentId = const Uuid().v1();
    String commentImgPathUrl = '';

    DateTime getCurrentDateTime = currentTimeDevice();

    if (commentImgPath != null) {
      final storageRef = ApiService.fireStorage.ref(
        'user-files/${ApiService.user.uid}/images/posts/comments/$commentId.jpg',
      );
      await storageRef.putFile(commentImgPath!);
      commentImgPathUrl = await storageRef.getDownloadURL();
    }
    CommentModel newComment = CommentModel(
      dataPublished: getCurrentDateTime.toString(),
      imageUrlComment: commentImgPathUrl,
      personUid: ApiService.user.uid,
      commentType: CommentType.image.name,
      textComment: '',
      commentId: commentId,
    );

    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.commentsCollection)
        .doc(commentId)
        .set(newComment.toJson())
        .then((value) {
      if (commentImgPath != null) {
        commentImgPath = null;
      }
    });
  }

  @override
  Stream<List> getPostCommentsLikes({
    required String postUid,
    required String commentUid,
  }) {
    final StreamController<List> likesController = StreamController<List>();
    ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
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
  Future<void> addLikeComment({
    required String postUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .set({
      'personUid': ApiService.user.uid,
    });
  }

  @override
  Future<void> removeLikeFromComment({
    required String postUid,
    required String commentUid,
  }) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .doc(commentUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .delete();
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
        .collection(Collections.reportPostCommentCollection)
        .add(dataToUpdate)
        .then(
          (value) => showToast(msg: "The comment has been reported".tr),
        );
  }
}
