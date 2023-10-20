import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../core/api/api_dynamic_link.dart';
import '../../../../core/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

RxInt pageNumber = 0.obs;

class MainHomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ApiDynamicLink.initDynamicLinks();
    ApiService.updateUserStatus(status: true);
    ApiService.updateUserLocation();
    SystemChannels.lifecycle.setMessageHandler((message) {
      print('====================$message');
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
  }

  List<BottomNavigationBarItem> itemBottomNavigationBar = [
    BottomNavigationBarItem(
      icon: const Icon(IconlyBroken.home),
      label: 'Home'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyBroken.notification),
      label: 'Notice'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyBroken.video),
      label: 'Videos'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyBroken.category),
      label: 'Services'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(IconlyBroken.setting),
      label: 'Settings'.tr,
    ),
  ];
}
