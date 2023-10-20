import '../controller/main_home_screen_controller.dart';
import '../../../../core/constant/colors.dart';
import 'widgets/main_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeScreenController controller = Get.put(MainHomeScreenController());
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
          items: controller.itemBottomNavigationBar,
        ),
      ),
      body: const MainHomeScreenBody(),
    );
  }
}
