abstract class AddDetailsScreenRepo {
  Future<bool> isUsernameTaken({required String username});
  Future<void> addUserDataToDatabase({required String username});
}
