abstract class ProfileEditeMoreRepo {
  Future<void> addUserToListBlock({
    required String otherUid,
  });
  Future<void> deleteUserFromListBlock({
    required String otherUid,
  });
}
