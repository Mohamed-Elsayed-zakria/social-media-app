class AppController {
  static late String messageToUsers;
  static late String appVirsion;

  AppController.fromJson(Map<String, dynamic> json) {
    messageToUsers = json['message'];
    appVirsion = json['app_version'];
  }
}
