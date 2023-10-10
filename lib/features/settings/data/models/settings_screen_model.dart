class SettingsScreenModel {
  late String personalPicture;
  late String username;

  SettingsScreenModel({
    required this.personalPicture,
    required this.username,
  });
  SettingsScreenModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'];
    username = json['username'];
  }
}
