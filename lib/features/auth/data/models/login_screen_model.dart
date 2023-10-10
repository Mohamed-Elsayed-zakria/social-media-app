class LoginScreenModel {
  String? token;
  LoginScreenModel({
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token ?? '',
    };
  }
}
