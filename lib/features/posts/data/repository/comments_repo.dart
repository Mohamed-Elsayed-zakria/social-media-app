import '../../../../core/model/comment_model.dart';

abstract class CommentsRepo {
  Stream<List<CommentModel>> getAllComments({required String postId});

  Future<void> addNewCommentOfTypeText({
    required String postId,
    required String text,
  });
  Future<void> addNewCommentOfTypeImage({
    required String postId,
  });

  Stream<List> getPostCommentsLikes({
    required String postUid,
    required String commentUid,
  });

  Future<void> addLikeComment({
    required String postUid,
    required String commentUid,
  });

  Future<void> removeLikeFromComment({
    required String postUid,
    required String commentUid,
  });

  Future<void> deleteComment({
    required String postUid,
    required String commentUid,
  });

  Future<void> updateComment({
    required String newTextComment,
    required String commentUid,
    required String postUid,
  });

  Future<void> reportComment({
    required CommentModel commentData,
    required String postUid,
  });
}
