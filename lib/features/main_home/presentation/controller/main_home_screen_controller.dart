import '../../../../core/api/api_dynamic_link.dart';
import '../../../../core/api/api_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

bool isBackPressed = false;

RxInt pageNumber = 0.obs;

class MainHomeScreenController extends GetxController {
  @override
  void onInit() async {
    ApiDynamicLink.initDynamicLinks();
    ApiService.updateUserStatus(status: true);
    ApiService.updateUserLocation();
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.toString().contains('resume')) {
        ApiService.updateUserStatus(status: true);
      }
      if (message.toString().contains('pause')) {
        ApiService.updateUserStatus(status: false);
      }
      if (message.toString().contains('inactive')) {
        ApiService.updateUserStatus(status: false);
      }
      return Future.value(message);
    });
    super.onInit();
  }
}
