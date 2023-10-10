class HomeScreenModel {
  late String? personalPicture;
  late String? username;
  HomeScreenModel({
    this.personalPicture,
    this.username,
  });

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'] ?? '';
    username = json['username'] ?? '';
  }
}
