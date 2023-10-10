import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/post_model.dart';

abstract class CustomPostRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPostComments({
    required String postUid,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostLikes({
    required String postUid,
  });

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData({
    required String personUid,
  });

  Future<List<PostModel>> getPostDetails({required String postId});

  Future<void> addLikeToPost({required String postId});

  Future<void> removeLikeToPost({required String postId});

  Future<void> reportThePost({required PostModel data});

  Future<void> deletePost({required PostModel data});

  Future<void> addSavedItems({required PostModel data});
}
