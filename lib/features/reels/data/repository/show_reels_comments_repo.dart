import '../../../../core/model/comment_model.dart';

abstract class ShowReelsCommentsRepo {
  Stream<List<CommentModel>> getAllReelsComments({required String videoUid});
  Future<void> addNewReelsComment({
    required CommentType commentType,
    required String videoUid,
    required String text,
  });
  Stream<List> getReelsCommentsLikes({
    required String videoUid,
    required String commentUid,
  });
  Future<void> addReelsLikeComment({
    required String videoUid,
    required String commentUid,
  });
  Future<void> removeReelsLikeFromComment({
    required String videoUid,
    required String commentUid,
  });
  Future<void> deleteReelsComment({
    required String videoUid,
    required String commentUid,
  });
  Future<void> updateReelsComment({
    required String newTextComment,
    required String commentUid,
    required String videoUid,
  });
  Future<void> reportReelsComment({
    required CommentModel commentData,
    required String videoUid,
  });
}
