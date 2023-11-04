import '../controller/main_home_screen_controller.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constant/colors.dart';
import 'widgets/main_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeScreenController());
    return WillPopScope(
      onWillPop: () async {
        if (isBackPressed) {
          return true;
        } else {
          Fluttertoast.showToast(
            msg: "Press back again to exit".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          isBackPressed = true;
          Future.delayed(
            const Duration(seconds: 3),
            () => isBackPressed = false,
          );
          return false;
        }
      },
      child: Scaffold(
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
            items: [
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
            ],
          ),
        ),
        body: const MainHomeScreenBody(),
      ),
    );
  }
}
