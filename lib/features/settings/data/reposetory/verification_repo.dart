abstract class VerificationRepo {
  Future<void> submitVerification({
    required String fullname,
    required String message,
  });
}
