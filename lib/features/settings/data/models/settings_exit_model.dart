class SettingsExitModel {
  String? token;

  SettingsExitModel({
    required this.token,
  });
  Map<String, dynamic> toJson() {
    return {
      'token': token ?? '',
    };
  }
}
