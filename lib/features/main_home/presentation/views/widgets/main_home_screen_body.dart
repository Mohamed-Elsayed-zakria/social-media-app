import '../../../../services/presentation/view/services_screen.dart';
import '../../../../settings/presentation/views/settings_screen.dart';
import '../../../../notifications/presentation/view/notice_screen.dart';
import '../../../../videos/presentaion/view/video_screen.dart';
import '../../../../home/presentaion/view/home_screen.dart';
import '../../controller/main_home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreenBody extends StatelessWidget {
  const MainHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: pageNumber.value,
        children: const [
          HomeScreen(),
          NoticeScreen(),
          VideoScreen(),
          ServicesScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
