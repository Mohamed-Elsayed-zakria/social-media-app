abstract class RegisterScreenRepo {
  Future<void> createNewAccount({
    required String emailAddress,
    required String password,
  });
}
