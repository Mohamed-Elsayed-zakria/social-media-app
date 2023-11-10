class AppController {
  static String? messageToUsers;
  static String? appVirsion;

  AppController.fromJson(Map<String, dynamic> json) {
    messageToUsers = json['message'];
    appVirsion = json['app_version'];
  }
}
