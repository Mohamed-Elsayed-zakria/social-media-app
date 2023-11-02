abstract class ProfileEditeRepo {
  Future<void> uploadImagePicture();
  Future<void> uploadImageCover();
  Future<void> updateBio({required String text});
}
