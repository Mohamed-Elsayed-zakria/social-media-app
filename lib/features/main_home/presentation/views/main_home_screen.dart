import 'package:flash/core/api/api_service.dart';
import 'package:flutter/services.dart';
import '../../../../core/api/api_dynamic_link.dart';
import '../controller/main_home_screen_controller.dart';
import '../../../../core/constant/colors.dart';
import 'widgets/main_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
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
      if (message.toString().contains('unhandled')) {
        ApiService.updateUserStatus(status: false);
      }
      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.kPrimaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: pageNumber.value,
          onTap: (value) {
            pageNumber.value = value;
          },
          items: itemBottomNavigationBar,
        ),
      ),
      body: const MainHomeScreenBody(),
    );
  }
}
