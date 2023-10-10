abstract class EditePersonalRepo {
  Future<bool> isUsernameTaken({required String username});
  Future<void> updateUserData({
    required String username,
    required String firstname,
    required String lastname,
    required String? dateTime,
  });
}
