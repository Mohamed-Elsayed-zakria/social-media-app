import '../../../../core/model/comment_model.dart';

abstract class ShowReelsCommentsRepo {
  Stream<List<CommentModel>> getAllReelsComments({required String reelUid});
  Future<void> addNewReelsCommentOfTypeText({
    required String reelUid,
    required String text,
  });
  Future<void> addNewReelsCommentOfTypeImage({
    required String reelUid,
  });
  Stream<List> getReelsCommentsLikes({
    required String reelUid,
    required String commentUid,
  });
  Future<void> addReelsLikeComment({
    required String reelUid,
    required String commentUid,
  });
  Future<void> removeReelsLikeFromComment({
    required String reelUid,
    required String commentUid,
  });
  Future<void> deleteReelsComment({
    required String reelUid,
    required String commentUid,
  });
  Future<void> updateReelsComment({
    required String newTextComment,
    required String commentUid,
    required String reelUid,
  });
  Future<void> reportReelsComment({
    required CommentModel commentData,
    required String reelUid,
  });
}
