abstract class LoginScreenRepo {
  Future<void> loginWithAccuont({
    required String emailAddress,
    required String password,
  });
}
