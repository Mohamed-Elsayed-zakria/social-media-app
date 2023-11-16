import '../model/post_model.dart';

abstract class CustomPostRepo {
  Stream<int> getCommentCount({required String postUid});

  Stream<List> getPostLikes({required String postUid});

  Future<List<PostModel>> getPostDetails({required String postId});

  Future<void> addLikeToPost({required String postId});

  Future<void> removeLikeToPost({required String postId});

  Future<void> reportThePost({required PostModel data});

  Future<void> deletePost({required PostModel data});

  Future<void> addPostSavedItems({required PostModel data});
  
  Future<void> removePostSavedItems({required PostModel data});
}
