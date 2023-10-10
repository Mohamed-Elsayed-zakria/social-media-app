import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CommentsRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataToComments({
    required String personUid,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllComments({
    required String postId,
  });

  Future<void> addNewComment({
    required String postId,
    required String text,
  });

  Future<void> addLikeComment({
required String postUid,
    required String commentUid,
  });

  Future<void> removeLikeFromComment({
required String postUid,
    required String commentUid,
  });
}
