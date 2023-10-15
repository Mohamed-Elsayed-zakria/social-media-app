import '../model/comment_model.dart';

abstract class CommentsRepo {
  Stream<List<CommentModel>> getAllComments({required String postId});
  
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
