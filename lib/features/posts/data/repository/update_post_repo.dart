abstract class UpdatePostRepo {
  Future<void> updatePost({
    required String postUid,
    required String postStatus,
  });
}
